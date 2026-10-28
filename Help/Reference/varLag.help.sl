# varLag

- _varLag(input, time, curvature)_

Variable shaped lag.
Similar to lag but with other curve shapes than exponential.
A change on the input will take the specified time to reach the new value.

- input: the input signal
- time: lag time in seconds
- curvature: control curvature, 0 is linear, +- curves the segment up and down

Change curvature slowly over time:

```
let sqr = linLin(lfPulse(1, 0, 0.5), 0, 1, 100, 400);
let crv = varLag(sqr, 0.2, line(-8, 8, 15));
[sinOsc(crv, 0)] # 2 * 0.3
```

* * *

See also: lag, lagUd, lag2, lag3

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/VarLag.html)

Categories: Ugen
