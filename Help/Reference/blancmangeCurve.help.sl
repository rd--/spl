# blancmangeCurve

- _blancmangeCurve(n)_

The Blancmange curve function, also called the Takagi fractal curve,
is a pathological continuous function which is nowhere differentiable.
The _n_-th iteration contains _2^n+1_ points.

```
>>> 1L:4L.collect(blancmangeCurve/1)
[
	0 2 0;
	0 4 4 4 0;
	0 6 8 10 8 10 8 6 0;
	0 8 12 16 16 20 20 20
	16
	20 20 20 16 16 12 8 0
]
```

The curve is integer valued:

```
>>> 9L.blancmangeCurve
>>> .allTrue(isInteger/1)
true
```

Plot ninth iteration:

~~~spl svg=A
9L.blancmangeCurve
.linePlot
~~~

![](Help/Image/blancmangeCurve-A.svg)

Plot using the functional form of the curve:

~~~spl svg=B
let k = 9.0;
(0.0 -- 0.5).functionPlot { :x |
	let y = (1.0 .. k).collect { :n |
		let s = { :a |
			(a.round - a).abs
		};
		let m = 2.0 ^ n;
		s(m * x) / m
	}.sum;
	[x, y]
}
~~~

![](Help/Image/blancmangeCurve-B.svg)

The name is derived from the shape of the second iteration:

~~~spl svg=C
2L.blancmangeCurve
.linePlot
~~~

![](Help/Image/blancmangeCurve-C.svg)

* * *

See also: takagiFunction, weierstrassFunction

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BlancmangeFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Blancmange_curve)

Further Reading: Takagi 1901
