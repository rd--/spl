# TxLine

Exponential line generator.

_TxLine(start=0, end=1, dur=1, tr=0)_

Generates a triggered exponential curve from the start value to the end value.
Both the start and end values must be non-zero and have the same sign.

- start: starting value
- end: ending value
- dur: duration in seconds
- tr: trigger at zero crossing

Trigger upwards frequency sweep:

```
let tr = Impulse(0.25, 0);
let gainEnv = Decay2(tr, 0.01, 1);
EqPan(
	Saw(TxLine(100, 1000, 0.1, tr)),
	TLine(-1, 1, 0.75, tr)
) * gainEnv
```

* * *

See also: Line, TLine, XLine
