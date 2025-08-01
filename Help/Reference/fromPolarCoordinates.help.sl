# fromPolarCoordinates

- _fromPolarCoordinates([r θ])_

Answer the _(x, y)_ Cartesian coordinates corresponding to the polar coordinates _(r, θ)_,
where _r_ is radius and θ is angle.

Convert from polar to rectangular coordinates:

```
>>> [1 0].fromPolarCoordinates
[1 0]

>>> [1 1/2.pi].fromPolarCoordinates
[0 1]

>>> [2.sqrt 1/4.pi].fromPolarCoordinates
[1 1]
```

Collects over lists:

```
>>> [1 0; 2 1.pi; 1 0.5.pi]
>>> .fromPolarCoordinates
[1 0; -2 0; 0 1]
```

Plot points at polar coordinates where r and θ are equal:

~~~spl svg=A
1:123.collect { :n |
	[n n].fromPolarCoordinates
}.PointCloud
~~~

![](sw/spl/Help/Image/fromPolarCoordinates-A.svg)

Consider only primes:

~~~spl svg=B
1:47.prime.collect { :n |
	[n n].fromPolarCoordinates
}.PointCloud
~~~

![](sw/spl/Help/Image/fromPolarCoordinates-B.svg)

A longer prime sequence:

~~~spl svg=C
1:123.prime.collect { :n |
	[n n].fromPolarCoordinates
}.PointCloud
~~~

![](sw/spl/Help/Image/fromPolarCoordinates-C.svg)

* * *

See also: fromBipolarCoordinates, PolarCoordinates, toPolarCoordinates, fromSphericalCoordinates

Guides: Coordinate System Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromPolarCoordinates.html),
_W_
[1](https://en.wikipedia.org/wiki/Polar_coordinate_system)

Categories: Converting, Geometry
