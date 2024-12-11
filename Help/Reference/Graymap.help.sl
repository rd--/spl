# Graymap

- _Graymap(aMatrix)_

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
let n = r.randomReal(0, 10, [5 2]);
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

* * *

See also: Bitmap, matrixPlot, Svg

Categories: Graphics
