# isCarmichaelNumber

- _isCarmichaelNumber(n)_

Predicate to decide if _n_ is a Carmichael number.

There is one Carmichael less than one thousand:

```
>>> (501L, 503L .. 599L).select(
>>> 	isCarmichaelNumber/1
>>> )
[561]

>>> 0L:560L.allSatisfy { :b |
>>> 	b ^ 561L % 561L = b
>>> }
true
```

The first Carmichael numbers with four prime factors:

```
>>> 41041L.isCarmichaelNumber
true

>>> 41041L.primeFactors
[7 11 13 41]

>>> 62745L.isCarmichaelNumber
true

>>> 62745L.primeFactors
[3 5 47 89]
```

Carmichael numbers,
OEIS [A002997](https://oeis.org/A002997):

```
>>> [561L 1105L 1729L 2465L 2821L 6601L 8911L]
>>> .allTrue(isCarmichaelNumber/1)
true
```

For a Carmichael number _c_,
the entire group of multiplicative units modulo _c_ are _false witnesses_:

```
>>> let c = 1105L;
>>> 1L:c.select { :n |
>>> 	n.isCoprime(c)
>>> }.allSatisfy { :n |
>>> 	n ^ (c - 1L) % c = 1L
>>> }
true
```

* * *

See also: carmichaelLambda

Guides: Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CarmichaelNumber.html),
_OEIS_
[1](https://oeis.org/A002997),
_W_
[1](https://en.wikipedia.org/wiki/Carmichael_number)
