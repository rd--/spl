# line

- _line(start, end, dur)_

`line` is a unit generator that generates a line from the start value to the end value.

- start: starting value
- end: ending value
- dur: duration in seconds

sweep oscillator frequency:

```
sinOsc(line(200, 17000, 10), 0) * 0.1
```

Diverging frequencies:

```
sinOsc(
	line(
		[900 1100],
		[200 1300],
		[9 17]
	),
	0
) * 0.1
```

`xLine` is usually better than `line` for frequency:

```
sinOsc(xLine(200, 17000, 10), 0) * 0.1
```

_Note_: This is the SuperCollider _Line_ Ugen without the _doneAction_ input.

* * *

See also: xLine

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/line.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Line.html),

Categories: Ugen
