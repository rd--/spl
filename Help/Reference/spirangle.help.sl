# spirangle

- _spirangle(n, m, [x y], [r i], θ)_

Answer a `Line` of an _n_-angle spirangle,
to _m_ iterations,
with centre _(x,y)_,
radius increment _r_,
initial radial _i_
and start angle _θ_.

Draw a three-angle spirangle, or triangle spiral,
with a radius increment of one,
an initial radial of nine,
and iteration count of four:

~~~spl svg=A
3.spirangle(4, [0 0], [1 9], 0)
~~~

![](sw/spl/Help/Image/spirangle-A.svg)

Draw a four-angle spirangle, or square spiral, of six iterations

~~~spl svg=B
4.spirangle(6, [0 0], [1 4], 0)
~~~

![](sw/spl/Help/Image/spirangle-B.svg)

Draw a seven-angle spirangle or heptagon spiral, of nine iterations:

~~~spl svg=C
7.spirangle(9, [0 0], [1 2], 0)
~~~

![](sw/spl/Help/Image/spirangle-C.svg)

* * *

See also: Line, LineDrawing

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Spirangle)
