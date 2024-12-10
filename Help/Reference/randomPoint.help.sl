# randomPoint

- _randomPoint(aRegion, r, shape)_

Answer _shape_ random points on or in _aRegion_ drawn from the random number generator _r_.

At `Circle`:

~~~spl svg=A
let r = Sfc32(367814);
let c = Circle([0, 0], 1);
c.randomPoint(r, [66]).scatterPlot
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

See also: circlePoints, randomInteger, randomReal, randomVariate

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomPoint.html)

Categories: Random
