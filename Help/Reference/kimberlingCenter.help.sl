# kimberlingCenter

- _kimberlingCenter(t, n)_

Answer the _n_-th Kimberling center of the triangle _t_.

```
>>> let t = sssTriangle(3, 4, 5);
>>> 1:22.collect { :n |
>>> 	t.kimberlingCenter(n)
>>> }
[
	t.incenter,
	t.centroid,
	t.circumcenter,
	t.orthocenter,
	t.ninePointCenter,
	t.symmedianPoint,
	t.gergonnePoint,
	t.nagelPoint,
	t.mittenpunkt,
	t.spiekerCenter,
	t.feuerbachPoint,
	[44/15, 49/45],
	t.firstFermatPoint,
	t.secondFermatPoint,
	t.firstIsodynamicPoint,
	t.secondIsodynamicPoint,
	t.firstNapoleonPoint,
	t.secondNapoleonPoint,
	t.clawsonPoint,
	t.deLongchampsPoint,
	t.schifflerPoint,
	t.exeterPoint
]
```

The first few Kimberling centers on or within the right triangle:

~~~
let t = sssTriangle(3, 4, 5);
[
	t,
	(1:13 ++ 15:15 ++ 17:19)
	.collect { :n |
		t.kimberlingCenter(n)
	}.PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/kimberlingCenter-A.svg)

* * *

See also: Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KimberlingCenter.html),
_W_
[1](https://en.wikipedia.org/wiki/Encyclopedia_of_Triangle_Centers)

Further Reading: Kimberling 1998
