# incenter

- _incenter(t)_

Answer the incenter of the triangle _t_.

The incenter is Kimberling center one,
the trilinear coordinates are _1,1,1_:

```
>>> let t = [3 4 5].sssTriangle;
>>> let c = [1 1 1];
>>> (
>>> 	t.incenter,
>>> 	t.kimberlingCenter(1),
>>> 	t.fromTrilinearCoordinates(c)
>>> )
([3 1], [3 1], [3 1])
```

Draw incenter:

~~~spl svg=A
let t = [3 4 5].sssTriangle;
let c = t.incenter;
[t, Point(c)].LineDrawing
~~~

![](sw/spl/Help/Image/incenter-A.svg)

* * *

See also: excenters, incircle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Incenter.html),
_W_
[1](https://en.wikipedia.org/wiki/Incenter)
