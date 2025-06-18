# Graymap

- _Graymap(m)_

Answer a `Graymap` of the matrix _m_.
A `Graymap` is a discrete image where each cell is a real number between `zero` and `one`.

`Graymap` in portable graymap format:

```
>>> [1 0 0; 0 1 0; 0 0 1]
>>> .Graymap
>>> .asPgm(1)
[
	'P2'
	'3 3'
	'1'
	'1 0 0'
	'0 1 0'
	'0 0 1'
	''
].unlines
```

Plot a table of values of five sine waves in random directions:

~~~spl png=A
let r = Sfc32(31684);
let n = r.randomReal([0 10], [5 2]);
let k = 99;
let i = (0 -- 5).subdivide(k);
(
	1 - { :x :y |
		n.collect { :each |
			each.dot([x, y]).sin
		}.sum / 5
	}.table(i, i).abs
).Graymap
~~~

![](sw/spl/Help/Image/Graymap-A.png)

Plot the `sin` function at integer points:

~~~spl png=B
let i = -50:50;
{ :x :y |
	(x * y * 3E-3).sin * 0.5 + 0.5
}.table(i, i)
.Graymap
~~~

![](sw/spl/Help/Image/Graymap-B.png)

Draw Julia set:

~~~spl png=C
let julia = { :c |
	{ :y :x |
		let z = x.j(y);
		let n = 0;
		{ z.absSquared < 4 }.whileTrue {
			z := z ^ 2 + c;
			n := n + 1
		};
		n
	}.table(
		(-1 -- 1).discretize(100),
		(-1.5 -- 1.5).discretize(150)
	)
};
let m = julia(-0.786J0.147);
m
.rescale(m.deepMin, m.deepMax, 1, 0)
.Graymap
~~~

![](sw/spl/Help/Image/Graymap-C.png)

Draw trigonometric function, rescaling:

~~~spl png=D
let x = (-4 -- 4).discretize(100);
{ :i :j |
	i + ((i ^ 2) + (j ^ 2)).sin
}.table(x, x).rescale.Graymap
~~~

![](sw/spl/Help/Image/Graymap-D.png)

* * *

See also: asGraymap, Bitmap, Image, matrixPlot, Svg

Guides: Image Functions

Categories: Graphics
