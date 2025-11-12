# goldsteinPriceFunction

- _goldsteinPriceFunction([x₁ x₂])_

Implement the GoldsteinPrice test function.

Minima:

```
>>> [0 -1].goldsteinPriceFunction
3
```

Plot at half-integer points, log scaled:

~~~spl svg=A
let i = (-2, -1.5 .. 2);
{ :x :y |
	[x y].goldsteinPriceFunction
}.table(i, i).logScale.matrixPlot
~~~

![](sw/spl/Help/Image/goldsteinPriceFunction-A.svg)

Plot log scaled and rounded:

~~~spl png=B
let c = (-2 -- 2).subdivide(100);
{ :i :j |
	[i j].goldsteinPriceFunction
}.table(c, c)
.logScale
.rescale
.round(0.1)
.Greymap
~~~

![](sw/spl/Help/Image/goldsteinPriceFunction-B.png)

* * *

See also: rosenbrockFunction

Guides: Numerical Methods

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GoldsteinPriceFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Test_functions_for_optimization)
