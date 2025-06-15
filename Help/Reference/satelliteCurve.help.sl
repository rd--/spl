# satelliteCurve

- _satelliteCurve(r, α, k)_

A satellite curve is the trajectory of a point having uniform motion on a great circle of a rotating sphere.
_r_ is the radius of the sphere,
_α_ is the angle of the great circle,
_k_ is the ratio of the rotational velocities of the point and the sphere.

With _α=3/4π_ and _k=2_:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	satelliteCurve(1, 0.75.pi, 2)
)
~~~

![](sw/spl/Help/Image/satelliteCurve-A.svg)

With _k=3_:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	satelliteCurve(1, 0.75.pi, 3)
)
~~~

![](sw/spl/Help/Image/satelliteCurve-B.svg)

* * *

See also: cleliaCurve, sphericalTrochoid

Guides: Curve Functions

References:
_Ferréol_
[1](https://mathcurve.com/courbes3d.gb/satellite/satellite.shtml)
