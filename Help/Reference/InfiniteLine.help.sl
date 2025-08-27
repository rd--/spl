# InfiniteLine

- _InfiniteLine([p1 p2])_
- _InfiniteLine(p, v)_

A `Type` to represent and infinite straight line,
defined either as passing through _p_ in the direction _v_,
or as passing through the points _p1_ and _p2_.

```
>>> InfiniteLine([0 0], [1 1])
InfiniteLine([0 0], [1 1])

>>> let a = 2.sqrt / 2;
>>> InfiniteLine([0 0; 1 1])
InfiniteLine([0 0], [a a])

>>> InfiniteLine([2 0; 0 3])
InfiniteLine([2, 0], [-0.5547, 0.8321])

>>> InfiniteLine([1 2], [1 2/3])
InfiniteLine([1 2], [1 2/3])
```

Derive the `UnivariatePolynomial` of a line:

```
>>> InfiniteLine([2 0; 1 2]).polynomial
UnivariatePolynomial([4 -2])
```

* * *

See also: HalfLine, Line

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/InfiniteLine.html),
_W_
[1](https://en.wikipedia.org/wiki/Line_(geometry))

Categories: Geometry
