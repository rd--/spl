# isOrigin

- _isOrigin(p)_

Answer `true` if the point _p_ is at the origin.

At `SmallFloat`, the real number line:

```
>>> 0.isOrigin
true
```

At `List`, interpreted as cartesian coordinates:

```
>>> [0 0].isOrigin
true

>>> [0 0 0].isOrigin
true
```

At `Point`:

```
>>> Point([0 0 0]).isOrigin
true
```

At `CartesianCoordinates`:

```
>>> CartesianCoordinates([0 0 0]).isOrigin
true
```

At `PolarCoordinates`, tests if ρ=0:

```
>>> PolarCoordinates([0 0.25.pi]).isOrigin
true
```

* * *

See also: allSatisfy, isZero

Guides: Geometry Functions, Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Origin.html)
_W_
[1](https://en.wikipedia.org/wiki/Origin_(mathematics))

Categories: Geometry, Testing
