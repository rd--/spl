# rosenbrockFunction

- _rosenbrockFunction(a, b)_

Answer the Rosenbrock test function.

At _a=1_ zero is at _(1,1)_:

```
>>> rosenbrockFunction(1, 100)
>>> .value([1 1])
0
```

Plot at _y=1_:

~~~spl svg=A
let f:/1 = rosenbrockFunction(1, 100);
(-1.4 -- 1.4).functionPlot { :x |
	f([x 1])
}
~~~

![](sw/spl/Help/Image/rosenbrockFunction-A.svg)

Plot at _x=1_:

~~~spl svg=B
let f:/1 = rosenbrockFunction(1, 100);
(0.5 -- 1.5).functionPlot { :y |
	f([1 y])
}
~~~

![](sw/spl/Help/Image/rosenbrockFunction-B.svg)

Matrix plot, log scaled and rounded:

~~~spl png=C
let k = 100;
let x = (-2 -- 2).subdivide(k);
let y = (-3 -- 3).subdivide(k);
let f:/1 = rosenbrockFunction(1, 100);
{ :x :y |
	f([x y])
}.table(x, y)
.log
.rescale
.round(0.1)
.Graymap
~~~

![](sw/spl/Help/Image/rosenbrockFunction-C.png)

Contour plot of sparse sampling:

~~~spl svg=D
let k = 20;
let x = (-2 -- 2).subdivide(k);
let y = (-3 -- 3).subdivide(k);
let f:/1 = rosenbrockFunction(1, 100);
{ :x :y |
	f([x y])
}.contourPlot(x, y, 10 ^ [0 .. 3])
~~~

![](sw/spl/Help/Image/rosenbrockFunction-D.svg)

* * *

See also: griewankFunction, himmelblausFunction

Guides: Numerical Methods

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RosenbrockFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Rosenbrock_function)
