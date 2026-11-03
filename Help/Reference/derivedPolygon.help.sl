# derivedPolygon

- _derivedPolygon([v₁ v₂ v₃…], r)_

Answer the derived polygon whose vertices are at fractional distance _r_ along each side.

Ratios of area of inscribed regular polygons:

```
>>> let r = 0.75;
>>> 3:7.collect { :n |
>>> 	let p = n.regularPolygon;
>>> 	let q = p.derivedPolygon(r);
>>> 	p.area / q.area
>>> }
[2.2857 1.6 1.3497 1.2308 1.1644]
```

At `Polygon`, here a regular hexagon:

~~~spl svg=A
let h = 6.regularPolygon([0 0], 1, 0);
[
	h,
	h.derivedPolygon(0.85)
]
~~~

![](Help/Image/derivedPolygon-A.svg)

Iteratively at `Polygon`, here a regular hexagon:

~~~spl svg=B
let r = 0.85;
{ :p |
	p.derivedPolygon(r)
}.nestList(
	6.regularPolygon([0 0], 1, 0),
	9
)
~~~

![](Help/Image/derivedPolygon-B.svg)

* * *

See also: midpointPolygon

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DerivedPolygon.html)
