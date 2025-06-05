# nevillesAlgorithm

- _nevillesAlgorithm(x, m)_

Implement Neville’s algorithm for polynomial interpolation.
Given a matrix _m_ of _(x,y)_ coordinates,
evaluate the unique polynomial which passes through the given points at _x_.
The answer is a list of lists,
the last of which has one place,
telling the interpolated _y_ value.

```
>>> 1.6.nevillesAlgorithm(
>>> 	[1 0.75; 1.3 0.63; 1.5 0.55; 2 0.49]
>>> )
[
	0.75 0.63 0.55 0.49;
	0.51 0.51 0.538;
	0.51 0.522;
	0.5172
]
```

Plot interpolation of an inflected line:

~~~spl svg=A
let m = [1 0.75; 1.3 0.63; 1.5 0.55; 2 0.49];
(1 -- 2).functionPlot { :x |
	let [y] = x.nevillesAlgorithm(m).last;
	y
}
~~~

![](sw/spl/Help/Image/nevillesAlgorithm-A.svg)

Plot interpolation of a triangular signal:

~~~spl svg=B
let m = [0 0; 1 1; 2 0; 3 -1; 4 0];
(0 -- 4).functionPlot { :x |
	let [y] = x.nevillesAlgorithm(m).last;
	[x, y]
}
~~~

![](sw/spl/Help/Image/nevillesAlgorithm-B.svg)

* * *

See also: dividedDifferences

Guides: Interpolation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NevillesAlgorithm.html),
_W_
[1](https://en.wikipedia.org/wiki/Neville%27s_algorithm)
