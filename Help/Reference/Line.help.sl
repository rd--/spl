# Line

- _Line(aMatrix)_
- _Line(start, end, dur)_

A `Line` is a `Type` representing straight lines connecting a sequence of points.

Compute the `arcLength` of a line:

```
>>> [0 0; 1 1; 1 0; 2 0].Line.arcLength
2.sqrt + 2
```

Compute the `midpoint` of a line:

```
>>> [0 0; 1 1; 1 0; 2 0].Line.midpoint
[1, 2.sqrt / 2]

>>> [0 0 0; 1 1 1; 1 0 1; 0 0 1].Line.midpoint
[1, 3.sqrt / 2, 1]
```

The `arcLength` of a `Line` in three-dimensions:

```
>>> [0 0 0; 1 1 1; 0 1 1; 0 1 0].Line.arcLength
(3.sqrt + 2)
```

The Svg description of a straight line:

```
>>> Line([0 0; 1 1]).asSvg
'<line x1="0" y1="0" x2="1" y2="1" />'
```

The Svg description of a polyline:

```
>>> Line([0 0; 1 1; 1 0]).asSvg
'<polyline points="0,0 1,1 1,0" />'
```

The ternary form is a Line generator.
Generates a line from the start value to the end value.

- start: starting value
- end: ending value
- dur: duration in seconds

Sweep oscillator frequency:

```
SinOsc(Line(200, 17000, 10), 0) * 0.1
```

Diverging frequencies:

```
SinOsc(Line([900 1100], [200 1300], [9 17]), 0) * 0.1
```

`XLine` is usually better than `Line` for frequency:

```
SinOsc(XLine(200, 17000, 10), 0) * 0.1
```

_Note_: This is the Sc _Line_ Ugen without the _doneAction_ input.

* * *

See also: HalfLine, InfiniteLine, HalfPlane, InfinitePlane, Point, XLine

References:
_Csound_
[1](https://www.csounds.com/manual/html/line.html),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Line.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Line.html),
_W_
[1](https://en.wikipedia.org/wiki/Polygonal_chain)

Categories: Geometry, Ugen
