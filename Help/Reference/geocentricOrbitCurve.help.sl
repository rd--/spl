# geocentricOrbitCurve

- _geocentricOrbitCurve(α, β)_

Answer a parametric function that will calculate the apparent geocentric orbit of a planet with orbital period ratio _α_ and orbital distance ratio _β_ following a circular orbit.

Apparent geocentric orbit of Venus over eight years:

~~~spl svg=A
let alpha = (224.701 / 365.256);
let beta = 0.723;
(0 -- 8).discretize(
	700,
	alpha.geocentricOrbitCurve(beta)
).Line
~~~

![](sw/spl/Help/Image/geocentricOrbitCurve-A.svg)

Apparent geocentric orbit of Juno over thirteen years:

~~~spl svg=B
let alpha = 1594.627 / 365.256;
let beta = 2.67;
(0 -- 13).discretize(
	700,
	alpha.geocentricOrbitCurve(beta)
).Line
~~~

![](sw/spl/Help/Image/geocentricOrbitCurve-B.svg)

Apparent geocentric orbit of Mars over fifteen years:

~~~spl svg=C
let alpha = 686.980 / 365.256;
let beta = 1.523;
(0 -- 15).discretize(
	700,
	alpha.geocentricOrbitCurve(beta)
).Line
~~~

![](sw/spl/Help/Image/geocentricOrbitCurve-C.svg)

Apparent geocentric orbit of Mercury over six years:

~~~spl svg=D
let alpha = 87.969 / 365.256;
let beta = 0.387;
(0 -- 6).discretize(
	700,
	alpha.geocentricOrbitCurve(beta)
).Line
~~~

![](sw/spl/Help/Image/geocentricOrbitCurve-D.svg)

* * *

See also: epicycloid, epitrochoid

Guides: Curve Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Geocentrism)
