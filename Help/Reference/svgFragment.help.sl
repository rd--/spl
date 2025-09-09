# svgFragment

- _svgFragment(x, p)_

Answers a `String` containg an Svg fragment describing the drawable object _x_,
given parameters _p_.

At `Circle`:

```
>>> Circle([0 0], 1)
>>> .svgFragment(precision: 0)
'<circle cx="0" cy="0" r="1" />'
```

At `Ellipse`:

```
>>> Ellipse([0 0], [2 1])
>>> .svgFragment(precision: 0)
'<ellipse cx="0" cy="0" rx="2" ry="1" />'
```

At `Line`, a line segment:

```
>>> Line([0 0; 1 1])
>>> .svgFragment(precision: 0)
'<line x1="0" y1="0" x2="1" y2="1" />'
```

At `Line`, a polyline:

```
>>> Line([0 0; 1 1; 1 0])
>>> .svgFragment(precision: 0)
'<polyline points="0,0 1,1 1,0" />'
```

At `Polygon`:

```
>>> Polygon([0 0; 1 0; 0 1])
>>> .svgFragment(precision: 0)
'<polygon points="0,0 1,0 0,1" />'
```

At `Triangle`:

```
>>> Triangle([0 0; 1 0; 0 1])
>>> .svgFragment(precision: 0)
'<polygon points="0,0 1,0 0,1" />'
```

At `Arc`:

```
>>> Arc([0 0], [1 1], [0 1])
>>> .svgFragment(precision: 0)
'<path d="M 1,0 A 1 1 0 0 1 1,1" />'
```

At `BezierCurve`:

```
>>> BezierCurve([0 0; 1 1; 2 0], 2)
>>> .svgFragment(precision: 0)
'<path d="M 0,0 Q 1,1 2,0" />'
```

At `Parallelogram`:

```
>>> Parallelogram([0 0], [1 0; 1 1])
>>> .svgFragment(precision: 0)
'<polygon points="0,0 1,0 2,1 1,1" />'
```

At `Point`:

```
>>> Point([0 0])
>>> .svgFragment(
>>> 	precision: 0,
>>> 	scaleFactor: 0.5
>>> )
'<circle cx="0" cy="0" r="1" />'
```

At `Rectangle`:

```
>>> Rectangle([0 0], [ 1 1])
>>> .svgFragment(precision: 0)
'<rect x="0" y="0" width="1" height="1" />'
```

* * *

See also: Geometry, LineDrawing, Svg

Guides: Drawing Functions, Geometry Functions
