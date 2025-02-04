# Bitmap

- _Bitmap(aMatrix)_

A `Bitmap` is a discrete image where each cell is either `zero` or `one`.

`Bitmap` in portable bitmap format:

```
>>> [1 0 0; 0 1 0; 0 0 1]
>>> .Bitmap
>>> .asPbm
[
	'P1'
	'3 3'
	'1 0 0'
	'0 1 0'
	'0 0 1'
	''
].unlines
```

Draw `identityMatrix`:

~~~spl png=A
33.identityMatrix.Bitmap
~~~

![](sw/spl/Help/Image/Bitmap-A.png)

Bit map image function,
evaluate for _(x,y)_ lattice,
draw when either is near `zero`:

~~~spl png=B
let i = (-1 -- 1).subdivide(99);
{ :x :y |
	let e = 0.02;
	(x.abs < e) | {
		y.abs < e
	}
}.table(i, i).boole.Bitmap
~~~

![](sw/spl/Help/Image/Bitmap-B.png)

* * *

See also: asPbm, Graymap, matrixPlot, Svg

Categories: Graphics
