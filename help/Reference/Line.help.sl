# Line

_Line(start, end, dur)_

Line generator.
Generates a line from the start value to the end value.

- start: starting value
- end: ending value
- dur: duration in seconds

Sweep oscillator frequency:

```
SinOsc(Line(200, 17000, 10), 0) * 0.1
```

XLine is usually better than Line for frequency:

```
SinOsc(XLine(200, 17000, 10), 0) * 0.1
```

_Note_: This is the Sc _Line_ Ugen without the _doneAction_ input.

* * *

See also: XLine

Categories: Ugen
