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

* * *

See also: Graymap, Svg

Categories: Graphics
