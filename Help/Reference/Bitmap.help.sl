# Bitmap

- _Bitmap(m, n=1)_

Answer a `Bitmap` of the matrix _m_ scaled by the integer _n_.
A `Bitmap` is a discrete image where each cell is either `zero` or `one`.

Show a `Bitmap` in the textual portable bitmap,
or _pbm_,
format:

```
>> [1 0 0; 0 1 0; 0 0 1]
>> .Bitmap
>> .asPbm
P1
3 3
1 0 0
0 1 0
0 0 1
```

The same bitmap scaled by two:

```
>> [1 0 0; 0 1 0; 0 0 1]
>> .Bitmap(2)
>> .asPbm
P1
6 6
1 1 0 0 0 0
1 1 0 0 0 0
0 0 1 1 0 0
0 0 1 1 0 0
0 0 0 0 1 1
0 0 0 0 1 1
```

Draw `identityMatrix` scaled by eight:

~~~spl png=A
13.identityMatrix.Bitmap(8)
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

See also: asPbm, Greymap, matrixPlot, Svg

Guides: Image Functions

Categories: Graphics
