# griewankFunction

- _griewankFunction([x₁ x₂ …])_

Implement the Griewank test function.

Zeros:

```
>>> [0].griewankFunction
0

>>> [0 0].griewankFunction
0
```

Plot in one dimension at integer values:

~~~spl svg=A
-200:200.collect { :x |
	[x].griewankFunction
}.linePlot
~~~

![](sw/spl/Help/Image/griewankFunction-A.svg)

Plot in one dimension:

~~~spl svg=B
(0 -- 50).functionPlot { :x |
	[x].griewankFunction
}
~~~

![](sw/spl/Help/Image/griewankFunction-B.svg)

Plot at integer points in two dimensions:

~~~spl svg=C
{ :i :j |
	[i j].griewankFunction
}.table(-5:5, -5:5).matrixPlot
~~~

![](sw/spl/Help/Image/griewankFunction-C.svg)

Plot in two dimensions:

~~~spl png=D
let c = (-100 -- 100).subdivide(100);
{ :i :j |
	[i j].griewankFunction
}.table(c, c).rescale.Graymap
~~~

![](sw/spl/Help/Image/griewankFunction-D.png)

* * *

See also: rosenbrockFunction

Guides: Numerical Methods

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GriewankFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Griewank_function)
