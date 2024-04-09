# Changed

- _Changed(input, threshold=0)_

Triggers when a value changes.
A special case fixed filter.

- input: signal input
- threshold: threshold

Implements the formula:

> _out(i) = abs(input(i) - input(i-1)) > threshold_

Detect changes in a signal:

```
let s = LfNoise0(2);
let c = Changed(s, 0);
let d = Decay2(c, 0.01, 0.5);
SinOsc(440 + ([s, d] * 440), 0) * 0.1
```

* * *

See also: Hpz1, Hpz2

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Changed.html)

Categories: Ugen, Filter
