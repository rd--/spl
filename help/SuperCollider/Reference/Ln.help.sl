# Ln -- line generator

_Ln(start, end, dur)_

Generates a line from the start value to the end value.

- start: starting value
- end: ending value
- dur: duration in seconds

XLn is usually better than Ln for frequency:

	SinOsc(Ln(200, 17000, 10), 0) * 0.1

_Note_: This is the Sc _Line_ Ugen without the _doneAction_ input.

* * *

See also: XLn
