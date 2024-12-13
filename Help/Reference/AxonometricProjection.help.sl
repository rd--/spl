# AxonometricProjection

Projections from three to two dimensions.

One convention is that
_x_ is back to front,
_y_ is left to right, and
_z_ is below to above.

In the picture below the rectangle _r_ is in the horizontal (_x_ & _y_) plane,
and the line _l_ first moves up (_z_), then right (_y_) then torward the front (_x_):

~~~
let r = workspace::r := [
	-2 -1 0;
	+2 -1 0;
	+2 +1 0;
	-2 +1 0
];
let l = workspace::l := [
	0 0 0;
	0 0 1;
	0 1 1;
	1 1 1
];
let p = AxonometricProjection('Chinese');
let p:/1 = p.asBlock;
let t = { :list |
	list.collect { :each |
		let [x, y, z] = each;
		[y.negated, z, x.negated].p
	}
};
[r.t.Polygon, l.t.Line].LineDrawing
~~~

![](sw/spl/Help/Image/AxonometricProjection-A.svg)

Another convention is that
_x_ is left to right,
_y_ is below to above, and
_z_ is front to back.

In the picture below the rectangle _r_ is in the vertical (_x_ & _y_) plane,
and the line _l_ first moves torward the back (_z_), then up (_y_), then right (_x_):

~~~
let r = workspace::r;
let l = workspace::l;
let p = AxonometricProjection('Chinese');
let p:/1 = p.asBlock;
let t = { :list |
	list.collect { :each |
		let [x, y, z] = each;
		[x.negated, y, z].p
	}
};
[r.t.Polygon, l.t.Line].LineDrawing
~~~

![](sw/spl/Help/Image/AxonometricProjection-B.svg)

The `linePlot` method follows the first convention:

~~~spl svg=C
[
	0 0 0;
	0 0 1;
	1 0 1;
	1 1 1
].linePlot
~~~

![](sw/spl/Help/Image/AxonometricProjection-C.svg)

* * *

See also: linePlot

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianCoordinates.html),
_W_
[1](https://en.wikipedia.org/wiki/Axonometric_projection)
[2](https://en.wikipedia.org/wiki/Cartesian_coordinate_system)

Further Reading: Krikke 2000
