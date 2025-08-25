# isSuperparticular

- _isSuperparticular(n/d)_

Answer `true` if the fraction _n/d_ is a superparticular ratio, else `false`.

A superparticular ratio, or epimoric ratio, is the ratio of two consecutive integer numbers.
For any _n_, _(n + 1) / n_, or equivalently _1 + (1 / n)_, is a superparticular ratio.
Equivalently, a ratio in which the antecedent exceeds the consequent by one.

2/1 is superparticular:

```
>>> 2/1.isSuperparticular
true
```

2/3 is not superparticular:

```
>>> 2/3.isSuperparticular
false
```

The first eight superparticular ratios, and their values in `cents`:

```
>>> let r = Fraction(2:9, 1:8);
>>> let c = r.ratioToCents.round;
>>> (r, c, r.allSatisfy(isSuperparticular:/1))
(
	[2/1 3/2 4/3 5/4 6/5 7/6 8/7 9/8],
	[1200 702 498 386 316 267 231 204],
	true
)
```

The ratio between two successive superparticular ratios is always superparticular:

```
>>> 23/22 / 22/21
483/484

>>> 48/47 * 47/46
24/23
```

The ratio between two successive members of the Farey sequence is superparticular:

```
>>> let f = 6.fareySequence;
>>> (2 .. f.size - 1).collect { :i |
>>> 	f[i + 1] / f[i]
>>> }
[6/5 5/4 4/3 6/5 5/4 6/5 10/9 9/8 16/15 25/24 6/5]
```

* * *

See also: fareySequence, Fraction, isSquareSuperparticular

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Superparticular_ratio),
_Xenharmonic_
[1](https://en.xen.wiki/w/Superparticular_ratio)

Further Reading: Barbour 1953

Categories: Testing, Math
