# cos

- _cos(x)_

Answers the cosine of the number _x_.

```
>>> 1/6.pi.cos
3.sqrt / 2

>>> 1/5.pi.cos
(1 + 5.sqrt) / 4

>>> 30.degree.cos
3.sqrt / 2

>>> 1.2.cos
0.362358
```

`cos` can take `Complex` number inputs:

```
>>> 2.5J1.cos
-1.23623J-0.70333
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].cos
[0.36236 0.07074 -0.22720]
```

Fixed point:

```
>>> 0.7390851332.cos
0.7390851332
```

The inverse is `arcCos`:

```
>>> 1.cos.arcCos
1
```

List of _y_-coordinates of point moving in clockwise square spiral,
OEIS [A268038](https://oeis.org/A268038):

```
>>> let f = { :n |
>>> 	(n = 0).if {
>>> 		0
>>> 	} {
>>> 		let a = 4 * (n - 1) + 1;
>>> 		let b = a.sqrt.floor % 4;
>>> 		f(n - 1) + cos(b.pi / 2)
>>> 	}
>>> };
>>> 0:74.collect(f:/1).round
[
	 0  0 -1 -1 -1  0  1  1  1  1
	 0 -1 -2 -2 -2 -2 -2 -1  0  1
	 2  2  2  2  2  2  1  0 -1 -2
	-3 -3 -3 -3 -3 -3 -3 -2 -1  0
	 1  2  3  3  3  3  3  3  3  3
	 2  1  0 -1 -2 -3 -4 -4 -4 -4
	-4 -4 -4 -4 -4 -3 -2 -1  0  1
	 2  3  4  4  4
]
```

Nonnegative integers for which _cos(n)_ is positive,
OEIS [A131503](https://oeis.org/A131503):

```
>>> 0:27.select { :n | n.cos > 0 }
[0 1 5 6 7 11 12 13 14 18 19 20 24 25 26]
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 2.pi).functionPlot(cos:/1)
~~~

![](sw/spl/Help/Image/cos-A.svg)

Increasing amplitude:

~~~spl svg=B
(0 -- 16.pi).functionPlot { :u | u * u.cos }
~~~

![](sw/spl/Help/Image/cos-B.svg)

Noncommensurate waves (quasiperiodic function):

~~~spl svg=C
(0 -- 16.pi).functionPlot { :x |
	x.cos + (x * 2.sqrt).cos
}
~~~

![](sw/spl/Help/Image/cos-C.svg)

Spiral:

~~~spl svg=D
(0 -- 6.pi).subdivide(200).collect { :t |
	[
		t / 1.pi * t.cos,
		t / 1.pi * t.sin
	]
}.Line
~~~

![](sw/spl/Help/Image/cos-D.svg)

Plot `cos` alongside a Padé approximation:

~~~spl svg=E
(-1.pi -- 1.pi).functionPlot([
	cos:/1,
	cosApproximation:/1
])
~~~

![](sw/spl/Help/Image/cos-E.svg)

Chirp signal:

~~~spl svg=F
(1 .. 100).functionPlot { :i |
	((i / 4) + (i / 20).square).cos
}
~~~

![](sw/spl/Help/Image/cos-F.svg)

Phase warping and amplitude modulation:

~~~spl svg=G
(0 -- 1).functionPlot { :x |
	let p = 50 * (x ^ x);
	let a = 1 / ((2 * x) + 1);
	p.cos * a
}
~~~

![](sw/spl/Help/Image/cos-G.svg)

* * *

See also: arcCos, arcCosh, cosh, sec, sin, tan

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Cosine.html)
[2](https://reference.wolfram.com/language/ref/Cos.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.cos.html),
_OEIS_
[1](https://oeis.org/A268038),
_Smalltalk_
5.6.7.5,
_W_
[1](https://en.wikipedia.org/wiki/Cosine)

Categories: Math, Trigonometry
