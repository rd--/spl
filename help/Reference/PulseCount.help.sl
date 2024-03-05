# PulseCount

- _PulseCount(trig=0, reset=0)_

Pulse counter.
Each trigger increments a counter which is output as a signal.

- trig: trigger
- reset: resets the counter to zero when triggered.

Pulse count as frequency input:

```
let count = PulseCount(Impulse(10, 0), Impulse(0.4, 0));
SinOsc(count * 200, 0) * 0.05
```

* * *

See also: Stepper

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PulseCount.html)
