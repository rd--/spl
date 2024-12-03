# Writing

- _Writing(aString, coordinates)_

`Writing` is a `Type` holding a `String` with associated coordinates.

Writing can be part of a line drawing:

~~~spl svg=A
let c = Circle([0 0], 100);
let w = Writing('Writing', [0, 0]);
let r = w.boundingBox.asRectangle;
[c, w, r].LineDrawing
~~~

![](sw/spl/Help/Image/Writing-A.svg)

Rationale: `Text` is a primitive type.
It could be renamed safely, and this object called `Text`.

* * *

See also: Record, String
