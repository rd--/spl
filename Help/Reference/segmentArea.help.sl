# segmentArea

- _segmentArea(a)_

Answer the segment area of the circular sector specified by the arc _a_.

```
>>> let r = 1;
>>> let a = Arc([0 0], [r r], [0 1/2.pi]);
>>> a.sectorArea - a.segmentArea
1/2
```

The central angle must be less than π:

```
>>> let a = Arc([0 0], [1 1], [1/2.pi 1/3.pi]);
>>> { a.segmentArea }.hasError
true
```

* * *

See also: Arc, segmentArea

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CircularSegment.html),
_W_
[1](https://en.wikipedia.org/wiki/Circular_segment)
