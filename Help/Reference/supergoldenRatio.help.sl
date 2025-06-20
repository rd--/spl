# supergoldenRatio

- _supergoldenRatio(n)_

Answer _n_ times the supergolden ratio, written ψ.

The supergolden ratio is a geometrical proportion close to 85/58:

```
>>> 1.supergoldenRatio
85/58

>>> (1.supergoldenRatio, 85 / 58)
(1.4656, 1.4655)
```

Its true value is the real solution of the equation _x^3=x^2+1_:

```
>>> let x = 1.supergoldenRatio;
>>> x ^ 2 + 1
(x ^ 3)
```

It has the closed form:

```
>>> (2 / 3)
>>> *
>>> (1 / 3 * 14.5J0.arcCos).cos
>>> +
>>> (1 / 3)
1.supergoldenRatio
```

The continued fraction of its square begins as a permutation of the first six natural numbers,
and the next term is equal to their sum plus one:

```
>>> (1.supergoldenRatio ^ 2)
>>> .continuedFraction(7)
[2 6 1 3 5 4 22]
```

The sum of the first eight subharmonics:

```
>>> 0:7.collect { :n |
>>> 	1.supergoldenRatio ^ n.negated
>>> }.sum
3
```

* * *

See also: goldenRatio, narayanaSequence

Guides: Integer Sequences, Mathematical Constants

Unicode: U+003C8 ψ Greek Small Letter Psi

References:
_OEIS_
[1](https://oeis.org/A092526),
_W_
[1](https://en.wikipedia.org/wiki/Supergolden_ratio)

Categories: Math, Constant
