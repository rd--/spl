# Line

- _Line(aPoint, anotherPoint)_
- _Line(start, end, dur)_

Compute the `arcLength` of a line:

```
>>> Line([0 0], [1 1]).arcLength
2.sqrt
```

Compute the `midpoint` of a line:

```
>>> Line([0 0], [1 1]).midpoint
[1/2 1/2]
```

The `centroid` of a `Line` is its `midpoint`:

```
>>> Line([-1 -1], [1 1]).centroid
[0 0]
```

The `arcLength` of a `Line` in two-dimensions:

```
>>> Line([0 0], [1 1]).arcLength
2.sqrt
```

The `arcLength` of a `Line` in three-dimensions:

```
>>> Line([0 0 0], [1 1 1]).arcLength
3.sqrt
```

Line generator.
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

See also: XLine

References:
_Csound_
[1](https://www.csounds.com/manual/html/line.html),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Line.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Line.html)

Categories: Ugen
