# signedGcd

- _signedGcd(m, n)_

Signed greatest common divisor.

This definition extends the usual definition.
It returns a negative number if both operands are negative.
This makes it consistent with the lattice-theoretical interpretation
and it’s idempotency, commutative, associative, absorption laws.

```
>>> -1024.signedGcd(-256)
-256

>>> -1024.signedGcd(-1024.signedLcm(-256))
-1024
```

"greater" means "divisible by" in this interpretation,
so _signedGcd(-1, -1)_ returns a negative number.
This is necessary to make the whole system consistent.

* * *

See also: ||, gcd, lcm, signedLcm

Guides: Integer Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/GCD),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/plusdot#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/GreatestCommonDivisor.html)
[2](https://mathworld.wolfram.com/GCD.html),
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#gcd)

Further Reading: McDonnell 1975
