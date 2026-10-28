# txLine

- _txLine(start=0, end=1, dur=1, tr=0)_

Exponential line generator.
Generates a triggered exponential curve from the start value to the end value.
Both the start and end values must be non-zero and have the same sign.

- start: starting value
- end: ending value
- dur: duration in seconds
- tr: trigger at zero crossing

Trigger upwards frequency sweep every four seconds:

```
let tr = impulse(0.25, 0);
let gainEnv = decay2(tr, 0.01, 1);
eqPan(
	saw(txLine(100, 1000, 0.1, tr)),
	tLine(-1, 1, 0.75, tr)
) * gainEnv * 0.2
```

* * *

See also: Line, tLine, xLine

Guides: Unit Generators

Categories: Ugen
