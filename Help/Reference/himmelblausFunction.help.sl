# himmelblausFunction

- _himmelblausFunction(x, y)_

Implement Himmelblau’s test function.

Local maxima:

```
>>> himmelblausFunction(
>>> 	-0.270845, -0.923039
>>> )
181.61652
```

Local minima:

```
>>> [
>>> 	3 2;
>>> 	-2.805118 3.131312;
>>> 	-3.779310 -3.283186;
>>> 	3.584428 -1.848126
>>> ].collect { :v |
>>> 	himmelblausFunction(v[1], v[2])
>>> }
[0 0 0 0]
```

Matrix plot, log scaled and rounded:

~~~spl png=A
let k = 100;
let i = (-6 -- 6).subdivide(k);
himmelblausFunction:/2
.table(i, i)
.log
.rescale
.round(0.1)
.Graymap
~~~

![](sw/spl/Help/Image/himmelblausFunction-A.png)

Contour plot of sparse sampling:

~~~spl svg=B
let k = 20;
let i = (-6 -- 6).subdivide(k);
himmelblausFunction:/2
.contourPlot(i, i, 10 ^ [-2 .. 3])
~~~

![](sw/spl/Help/Image/himmelblausFunction-B.svg)

* * *

See also: ackleyFunction, griewankFunction, rosenbrockFunction

Guides: Numerical Methods

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RosenbrockFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Rosenbrock_function)
