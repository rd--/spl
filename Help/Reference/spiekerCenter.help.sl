# spiekerCenter

- _spiekerCenter(t)_

Answer the Spieker center of the triangle _t_.

```
>>> [3 4 5].sssTriangle
>>> .spiekerCenter
[2.6 0.7]

>>> [3 4 5].sssTriangle
>>> .medialTriangle
>>> .incenter
[2.6 0.7]
```

Plot Spieker center:

~~~spl svg=A
let t = [3 4 5].sssTriangle;
[
	t,
	t.medialTriangle,
	t.spiekerCenter.Point,
	t.spiekerCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/spiekerCenter-A.svg)

* * *

See also: incenter, medialTriangle, spiekerCircle, triangleCentre, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SpiekerCenter.html)
_W_
[1](https://en.wikipedia.org/wiki/Spieker_center)

