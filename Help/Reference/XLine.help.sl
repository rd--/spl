# XLine

- _XLine(start, end, dur)_

Exponential line generator.
Generates an exponential curve from the start value to the end value.
Both the start and end values must be non-zero and have the same sign.

- start: starting value
- end: ending value
- dur: duration in seconds

Control frequency of sine oscillator:

```
SinOsc(XLine(200, 17000, 10), 0) * 0.1
```

_Note_: This is the Sc _XLine_ Ugen without the _doneAction_ input.

* * *

See also: Line, TLine, TxLine

References:
_Csound_
[1](https://csound.com/docs/manual/expon.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/XLine.html)

Categories: Ugen
