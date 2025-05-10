# xiaolinWuLineAlgorithm

- _xiaolinWuLineAlgorithm([x₁ y₁; x₂ y₂])_

Xiaolin Wu’s algorithm for drawing an anti-aliased line.
Answers a `List` of _(x, y, i)_ triples.

Quadrant one:

```
>>> [0 1; 6 4].xiaolinWuLineAlgorithm
[
	0 1 0.5;
	0 2 0;
	1 1 0.5;
	1 2 0.5;
	2 2 1;
	2 3 0;
	3 2 0.5;
	3 3 0.5;
	4 3 1;
	4 4 0;
	5 3 0.5;
	5 4 0.5;
	6 4 0.5;
	6 5 0
]
```

A matrix plot:

~~~spl svg=A
[1 1; 33 15]
.xiaolinWuLineAlgorithm
.collect { :each |
	let [x, y, g] = each;
	[y x] -> g
}
.SparseArray
.normal
.matrixPlot
~~~

![](sw/spl/Help/Image/xiaolinWuLineAlgorithm-A.svg)

* * *

See also: bresenhamLineAlgorithm

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Xiaolin_Wu%27s_line_algorithm)

Further Reading: Wu 1991

Categories: Geometry
