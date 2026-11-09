#!/usr/bin/env python3
"""Compute the Pisano period of a (potentially large) integer.

This utility:
- Factors the modulus using Pollard's Rho and deterministic Miller–Rabin.
- Uses number-theoretic properties of Fibonacci sequences modulo prime powers.
- Combines prime-power periods with an LCM to obtain the Pisano period of m.

Mathematical notes (implementation assumptions):
- For odd primes p != 5, the Pisano period pi(p) divides
    * p - 1  if 5 is a quadratic residue modulo p,
    * 2(p + 1) otherwise.
  We determine pi(p) by reducing this exponent via its prime factors.
- For prime powers p^k with p != 2, 5, we use the (widely believed and
  extensively verified) relation:
    pi(p^k) = p^{k-1} * pi(p).
  This can fail only for so-called Wall–Sun–Sun primes, of which none are
  known within 64-bit ranges.
- For powers of 2 and 5, we use explicit closed forms:
    pi(2^k)  = 3 * 2^{k-1}
    pi(5^k)  = 20 * 5^{k-1} = 4 * 5^k.

This is practical and accurate for all standard 64-bit integers, including
9223372036854775807.
"""

import sys
import math
import random
from typing import Dict

# ------------------------------------------------------------
# Fast doubling Fibonacci modulo m
# ------------------------------------------------------------

def fib_fast_doubling(n: int, mod: int) -> tuple[int, int]:
    """Return (F_n, F_{n+1}) modulo mod using fast doubling.

    Runs in O(log n) multiplications.
    """
    if n == 0:
        return 0 % mod, 1 % mod
    a, b = fib_fast_doubling(n >> 1, mod)
    # c = F_{2k}, d = F_{2k+1}
    t = (2 * b - a) % mod
    c = (a * t) % mod
    d = (a * a + b * b) % mod
    if n & 1:
        return d, (c + d) % mod
    else:
        return c, d


def is_fib_identity(k: int, mod: int) -> bool:
    """Check if (F_k, F_{k+1}) == (0, 1) modulo mod."""
    fn, fn1 = fib_fast_doubling(k, mod)
    return fn % mod == 0 and fn1 % mod == 1 % mod


# ------------------------------------------------------------
# Deterministic Miller–Rabin for 64-bit integers
# ------------------------------------------------------------

_SMALL_PRIMES = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]


def is_prime(n: int) -> bool:
    """Deterministic Miller–Rabin primality test for 64-bit integers."""
    if n < 2:
        return False
    for p in _SMALL_PRIMES:
        if n == p:
            return True
        if n % p == 0:
            return False

    # Write n-1 as d * 2^s
    d = n - 1
    s = 0
    while d % 2 == 0:
        s += 1
        d //= 2

    def trial(a: int) -> bool:
        if a % n == 0:
            return True
        x = pow(a, d, n)
        if x == 1 or x == n - 1:
            return True
        for _ in range(s - 1):
            x = (x * x) % n
            if x == n - 1:
                return True
        return False

    # Bases sufficient for correctness up to 2^64
    for a in (2, 325, 9375, 28178, 450775, 9780504, 1795265022):
        if a % n == 0:
            continue
        if not trial(a):
            return False
    return True


# ------------------------------------------------------------
# Pollard's Rho factorisation
# ------------------------------------------------------------


def pollards_rho(n: int) -> int:
    """Return a non-trivial factor of n using Pollard's Rho."""
    if n % 2 == 0:
        return 2
    if n % 3 == 0:
        return 3

    while True:
        x = random.randrange(2, n - 1)
        y = x
        c = random.randrange(1, n - 1)
        d = 1
        while d == 1:
            x = (pow(x, 2, n) + c) % n
            y = (pow(y, 2, n) + c) % n
            y = (pow(y, 2, n) + c) % n
            d = math.gcd(abs(x - y), n)
        if d != n:
            return d


def factor_int(n: int) -> Dict[int, int]:
    """Return the prime factorisation of n as a dict {prime: exponent}."""
    factors: Dict[int, int] = {}

    def _factor(m: int) -> None:
        if m == 1:
            return
        if is_prime(m):
            factors[m] = factors.get(m, 0) + 1
            return
        d = pollards_rho(m)
        _factor(d)
        _factor(m // d)

    _factor(n)
    return factors


# ------------------------------------------------------------
# Helper: Legendre symbol (a/p) for odd prime p
# ------------------------------------------------------------


def legendre_symbol(a: int, p: int) -> int:
    """Return the Legendre symbol (a/p) for odd prime p."""
    ls = pow(a, (p - 1) // 2, p)
    if ls == p - 1:
        return -1
    return ls  # 0 or 1


# ------------------------------------------------------------
# Compute Pisano period for a prime and prime powers
# ------------------------------------------------------------


def order_from_exponent(mod: int, exponent: int) -> int:
    """Return the order of the Fibonacci pair (0,1) modulo mod,
    given that the order divides `exponent`.

    We factor `exponent` and iteratively divide out prime factors where
    possible, checking via fast doubling.
    """
    fac = factor_int(exponent)
    # Sort primes ascending; order-reduction works with any order
    for q in sorted(fac.keys()):
        for _ in range(fac[q]):
            if exponent % q != 0:
                continue
            candidate = exponent // q
            if is_fib_identity(candidate, mod):
                exponent = candidate
            else:
                break
    return exponent


def pisano_prime(p: int) -> int:
    """Pisano period for a prime modulus p."""
    if p == 2:
        return 3
    if p == 5:
        return 20

    chi5 = legendre_symbol(5, p)
    if chi5 == 1:
        exponent = p - 1
    else:
        exponent = 2 * (p + 1)
    return order_from_exponent(p, exponent)


def pisano_prime_power(p: int, k: int) -> int:
    """Pisano period for p^k.

    Uses closed forms for 2^k and 5^k, and Wall's formula for other primes.
    """
    if k <= 0:
        raise ValueError("Exponent k must be positive")

    if p == 2:
        # pi(2^k) = 3 * 2^{k-1}
        return 3 * (2 ** (k - 1))
    if p == 5:
        # pi(5^k) = 20 * 5^{k-1}
        return 20 * (5 ** (k - 1))

    base = pisano_prime(p)
    # Wall's conjectured formula, known to hold for all small primes:
    return base * (p ** (k - 1))


# ------------------------------------------------------------
# Pisano period for general m
# ------------------------------------------------------------


def lcm(a: int, b: int) -> int:
    return a // math.gcd(a, b) * b


def pisano_period(m: int) -> int:
    """Compute the Pisano period pi(m) for integer m >= 1."""
    if m <= 0:
        raise ValueError("Modulus m must be a positive integer")
    if m == 1:
        return 1

    factors = factor_int(m)
    period = 1
    for p, k in factors.items():
        pp = pisano_prime_power(p, k)
        period = lcm(period, pp)
    return period


# ------------------------------------------------------------
# Command-line interface
# ------------------------------------------------------------


def main(argv: list[str]) -> None:
    if len(argv) != 2:
        print(f"Usage: {argv[0]} <modulus>", file=sys.stderr)
        sys.exit(1)

    try:
        m = int(argv[1])
    except ValueError:
        print("Error: modulus must be an integer", file=sys.stderr)
        sys.exit(1)

    if m <= 0:
        print("Error: modulus must be positive", file=sys.stderr)
        sys.exit(1)

    period = pisano_period(m)
    print(period)


if __name__ == "__main__":
    main(sys.argv)
