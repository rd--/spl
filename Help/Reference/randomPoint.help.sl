# randomPoint

- _randomPoint(aRegion, r, shape)_

Answer _shape_ random points on or in _aRegion_ drawn from the random number generator _r_.

At `Circle` answers points _on_ the circle:

~~~spl svg=A
Circle([0, 0], 1).randomPoint(
	Sfc32(367814),
	[66]
).scatterPlot
~~~

![](sw/spl/Help/Image/randomPoint-A.svg)

At `Rectangle`:

~~~spl svg=B
let r = Sfc32(789142);
Rectangle([0, 0], [1 1])
.randomPoint(r, [66])
.scatterPlot
~~~

![](sw/spl/Help/Image/randomPoint-B.svg)

* * *

See also: circlePoints, randomInteger, randomReal, randomSurfacePoint, randomVariate

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomPoint.html)

Categories: Random
