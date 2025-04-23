# r

- _r(aPoint)_
- _r(anInteger, anotherInteger)

In the unary case,
answers the _r_ or _radius_ field of _aPoint_.

In the binary case,
answer the `Fraction` with the indicated numerator and denominator.

At `PolarCoordinates`:

```
>>> PolarCoordinates([1 0]).r
1
```

At `SphericalCoordinates`:

```
>>> SphericalCoordinates([1 0 0]).r
1
```

At `Integer`, _r_ defines a _rational_ number, in Spl called a `Fraction`:

```
>>> 3.r(4)
3/4
```

Where supported `r` is displayed as 𝑟.

* * *

See also: phi, radius, rho, theta, x, y, z

Guides: Geometry Functions

Unicode: U+1D45F 𝑟 Mathematical Italic Small R

Categories: Accessing, Geometry
