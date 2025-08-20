# geocentricOrbitCurve

- _geocentricOrbitCurve(r)_

Answer a parametric function that will calculate the apparent geocentric orbit of a planet with orbital ratio _r_.

Apparent geocentric orbit of Venus:

~~~spl svg=A
let venus = 224.701;
let earth = 365.256;
(0 -- 8 * 2.pi).discretize(
	700,
	(venus / earth).geocentricOrbitCurve
).Line
~~~

![](sw/spl/Help/Image/geocentricOrbitCurve-A.svg)

Apparent geocentric orbit of Juno:

~~~spl svg=B
let earth = 365.256;
let juno = 1594.627;
(0 -- 3 * 2.pi).discretize(
	400,
	(earth / juno).geocentricOrbitCurve
).Line
~~~

![](sw/spl/Help/Image/geocentricOrbitCurve-B.svg)

Apparent geocentric orbit of Mars:

~~~spl svg=C
let earth = 365.256;
let mars = 686.980;
(0 -- 1.05 * 2.pi).discretize(
	400,
	(earth / mars).geocentricOrbitCurve
).Line
~~~

![](sw/spl/Help/Image/geocentricOrbitCurve-C.svg)

Apparent geocentric orbit of Mercury:

~~~spl svg=D
let mercury = 87.969;
let earth = 365.256;
(0 -- 6 * 2.pi).discretize(
	700,
	(mercury / earth)
	.geocentricOrbitCurve
).Line
~~~

![](sw/spl/Help/Image/geocentricOrbitCurve-D.svg)

* * *

See also: epicycloid, epitrochoid

Guides: Curve Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Geocentrism)
