# triangleWave

- _triangleWave(x)_

Answer a triangle wave that alternates between 1 and -1 with unit period.

Evaluate numerically:

```
>>> 0.2.triangleWave
0.8
```

Threads over lists:

```
>>> [0 1/4 1/2 3/4 1].triangleWave
[0 1 0 -1 0]

>>> [0.4 1.2 3.6].triangleWave
[0.4 0.8 -0.4]
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 3).functionPlot(triangleWave:/1)
~~~

![](sw/spl/Help/Image/triangleWave-A.svg)

* * *

See also: heavisideLambda, Piecewise, sawtoothWave, sin, squareWave, unitTriangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TriangleWave.html)
[2](https://reference.wolfram.com/language/ref/TriangleWave.html),
_W_
[1](https://en.wikipedia.org/wiki/Triangle_wave)
