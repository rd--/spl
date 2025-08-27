# spiekerCenter

- _spiekerCenter(t)_

Answer the Spieker circle of the triangle _t_.

```
>>> [3 4 5].sssTriangle
>>> .spiekerCircle
Circle([2.6 0.7], 0.5)

>>> [3 4 5].sssTriangle
>>> .medialTriangle
>>> .incircle
Circle([2.6 0.7], 0.5)
```

Plot Spieker circle:

~~~spl svg=A
let t = [3 4 5].sssTriangle;
[
	t,
	t.medialTriangle,
	t.spiekerCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/spiekerCircle-A.svg)

* * *

See also: incenter, medialTriangle, spiekerCircle, triangleCentre, Triangle

Guides: Geometry Functions, Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SpiekerCenter.html)
_W_
[1](https://en.wikipedia.org/wiki/Spieker_center)
