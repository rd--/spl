# Disk

- _Disk([x y], r)_

A `Type` that represents a disk of radius _r_ and center _x,y_.

```
>>> let d = Disk([0 0], 1);
>>> (d.isDisk, d.center, d.radius)
(true, [0 0], 1)
```

A plot of one hundred random points in the unit disk:

~~~spl svg=A
let r = Sfc32(893012);
Disk([0 0], 1)
.randomPoint(r, [100])
.scatterPlot
~~~

![](sw/spl/Help/Image/Disk-A.svg)

Draw seven random disks:

~~~spl svg=B
let g = Sfc32(637812);
let c = g.randomReal([-9 9], [7 2]);
let r = g.randomReal([0.1 1], [7]);
Disk(c, r).LineDrawing
~~~

![](sw/spl/Help/Image/Disk-B.svg)

* * *

See also: Ball, center, Circle, Polygon, radius, randomPoint, Sphere

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Disk.html)
[2](https://reference.wolfram.com/language/ref/Disk.html),
_W_
[1](https://en.wikipedia.org/wiki/Disk_(mathematics))

Categories: Geometry
