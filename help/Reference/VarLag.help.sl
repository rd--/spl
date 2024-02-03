# VarLag -- variable lag

_VarLag(input, time, curvature)_

Variable shaped lag.
Similar to Lag but with other curve shapes than exponential.
A change on the input will take the specified time to reach the new value.

- input: the input signal
- time: lag time in seconds
- curvature: control curvature, 0 is linear, +- curves the segment up and down

Change curvature slowly over time:

```
let sqr = LinLin(LfPulse(1, 0, 0.5), 0, 1, 100, 400);
let crv = VarLag(sqr, 0.2, Line(-8, 8, 15));
SinOsc(crv, 0) ! 2 * 0.3
```

* * *

See also: Lag, Lag2, Lag3, LagUd
