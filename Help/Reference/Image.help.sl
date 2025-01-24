# Image

- _Image(anArray)_

An `Image` is a discrete image where each cell is an _(r,g,b)_ triple of real numbers between `zero` and `one`.

`Image` in portable pixel map format:

```
>>> [1 0 0; 0 1 0:; 0 0 1; 0 1 1]
>>> .Image
>>> .asPpm(1)
[
	'P3'
	'2 2'
	'1'
	'1 0 0 0 1 0'
	'0 0 1 0 1 1'
	''
].unlines
```

* * *

See also: arrayPlot, Bitmap, Graymap, Svg

Categories: Graphics
