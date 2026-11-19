# goldsteinPriceFunction

- _goldsteinPriceFunction([x₁ x₂])_

Implement the GoldsteinPrice test function.

Minima:

```
>>> [0L -1L].goldsteinPriceFunction
3L
```

Plot at half-integer points, log scaled:

~~~spl svg=A
let i = (-2L, -3/2 .. 2L);
{ :x :y |
	[x y].goldsteinPriceFunction
}.table(i, i)
.matrixPlot.logScale
~~~

![](Help/Image/goldsteinPriceFunction-A.svg)

Plot log scaled and rounded:

~~~spl png=B
let c = (-2.0 -- 2.0).subdivide(100L);
{ :i :j |
	[i j].goldsteinPriceFunction
}.table(c, c)
.logScale
.rescale
.round(0.1)
.Greymap
~~~

![](Help/Image/goldsteinPriceFunction-B.png)

* * *

See also: rosenbrockFunction

Guides: Numerical Methods

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GoldsteinPriceFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Test_functions_for_optimization)
