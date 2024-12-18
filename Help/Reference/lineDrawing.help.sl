# lineDrawing

- _lineDrawing(anObject)_

Make a `LineDrawing` of _anObject_.

At `Plot`:

~~~spl svg=A
[1 .. 9].discretePlot.lineDrawing
~~~

![](sw/spl/Help/Image/lineDrawing-A.svg)

At `Scale`:

~~~spl svg=B
Scale(1, [2 2 3 2 3], 'Maj. Pentatonic')
.lineDrawing
~~~

![](sw/spl/Help/Image/lineDrawing-B.svg)

* * *

See also: Graph, LineDrawing, Plot, Scale, textDrawing
