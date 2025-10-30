# rastriginFunction

- _rastriginFunction([x₁ x₂ …])_

Implement the Rastrigin test function.

Minima:

```
>>> [0].rastriginFunction
0

>>> [0 0].rastriginFunction
0
```

Maxima:

```
>>> let x = 4.52299366;
>>> 1:9.collect { :n |
>>> 	(x # n).rastriginFunction
>>> }
[
	 40.35329
	 80.70658
	121.05987
	161.41316
	201.76645
	242.11974
	282.47303
	322.82632
	363.17961
]
```

Matrix plot:

~~~spl png=A
let k = 100;
let i = (-2 -- 2).subdivide(k);
{ :x :y |
	rastriginFunction([x, y])
}.table(i, i)
.rescale
.Graymap
~~~

![](sw/spl/Help/Image/rastriginFunction-A.png)

Contour plot of sparse sampling:

~~~spl svg=B
let k = 20;
let i = (-2.5 -- 2.5).subdivide(k);
{ :x :y |
	rastriginFunction([x y])
}.contourPlot(i, i, [5 15 30])
~~~

![](sw/spl/Help/Image/rastriginFunction-B.svg)

* * *

See also: griewankFunction, himmelblausFunction

Guides: Numerical Methods

References:
_W_
[1](https://en.wikipedia.org/wiki/Rastrigin_function)
