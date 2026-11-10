# isNearInteger

- _isNearInteger(x, ε)_

Answers `true` if the object _x_ is withn an ε value of an `Integer`,
else `false`.

```
>>> 1.000001.isNearInteger(1E-6)
true

>>> Float[1 .. 750].select { :n |
>>> 	(n ^ (1 / 3)).isNearInteger(1E-14)
>>> }
[1 8 27 64 125 216 343 512 729]

>>> 1:9 ^ 3
[1 8 27 64 125 216 343 512 729]
```

The characteristic function of the cubic numbers,
one if _n_ is a cube else zero,
OEIS [A010057](https://oeis.org/A010057):

~~~spl svg=A oeis=A010057
Float[1 .. 750].collect { :n |
	(n ^ (1 / 3)).isNearInteger(1E-14)
}.boole.discretePlot
~~~

![](Help/Image/isNearInteger-A.svg)

* * *

See also: Integer, Float, Number, isEqual, isInteger, isIntegerValuedNumber, isSimilar

Guides: Integer Functions, Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AlmostInteger.html),
_W_
[1](https://en.wikipedia.org/wiki/Integer)
