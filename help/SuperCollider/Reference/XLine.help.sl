# XLine -- exponential line generator

_XLine(tr=0, start=0, end=1, dur=1)_
_XLine(start, end, dur)_ == _XLine(1, start, end, dur)_

Generates an exponential curve from the start value to the end value.
Both the start and end values must be non-zero and have the same sign.

- start: starting value
- end: ending value
- dur: duration in seconds

Control frequency of sine oscillator:

	SinOsc(XLine(200, 17000, 10), 0) * 0.1

_Note_: This is the Sc _XLine_ Ugen without the _doneAction_ input.

* * *

See also: Line, TLine, TxLine
