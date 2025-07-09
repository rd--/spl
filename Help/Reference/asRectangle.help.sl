# asRectangle

- _asRectangle(aMatrix)_

Answer a `Rectangle` given _lower left_ and _upper right_ coordinates.

At `List`:

```
>>> [0 0; 1 1].asRectangle
Rectangle([0, 0], [1, 1])
```

The archetypal Pythagorean triangle,
as the enclosure of three squares:

~~~spl svg=A
[
	[0 -3; 3 0].asRectangle,
	[3 0; 7 4].asRectangle,
	[0 0; 5 5].asRectangle.rotated(
		1/2.pi - (4 / 5).arcCos,
		[0 0]
	)
].LineDrawing
~~~

![](sw/spl/Help/Image/asRectangle-A.svg)

* * *

See also: Rectangle

Guides: Geometry Functions

Categories: Geometry
