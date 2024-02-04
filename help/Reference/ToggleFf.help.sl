# ToggleFf

Toggle flip flop.

_ToggleFf(trig)_

Toggles between zero and one upon receiving a trigger.

- trig: trigger input

Increasing density triggers frequency switcher:

```
let ff = ToggleFf(Dust(XLine(1, 1000, 60)));
SinOsc(ff * 400 + 800, 0) * 0.1
```

* * *

See also: SetResetFf

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ToggleFF.html)
