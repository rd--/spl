# Disk

- _Disk(center, radius)_

A `Type` that represents a disk of _radius_ at _center_.

```
>>> let c = Disk([0 0], 1);
>>> (c.isDisk, c.center, c.radius)
(true, [0 0], 1)
```

A plot of one hundred random points in the unit disk:

~~~spl svg=A
let r = Sfc32(893012);
Disk([0, 0], 1)
.randomPoint(r, [100])
.scatterPlot
~~~

![](sw/spl/Help/Image/Disk-A.svg)

* * *

See also: Ball, center, Circle, Polygon, radius, randomPoint, Sphere

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Disk.html)
[2](https://reference.wolfram.com/language/ref/Disk.html)

Categories: Geometry
