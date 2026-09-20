# circumtangentialTriangle

- _circumtangentialTriangle(t)_

Answer the circumtangential triangle of the reference triangle _t_,
an equilateral triangle on the circumcircle of _t_.

Draw circumcircle and circumtangential triangle:

~~~spl svg=A
let t = Triangle([0 0.25; 5 0; 0.5 3.5]);
[
	t,
	t.circumcircle,
	t.circumtangentialTriangle
].GeometryCollection
~~~

![](Help/Image/circumtangentialTriangle-A.svg)

* * *

See also: Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CircumtangentialTriangle.html)
