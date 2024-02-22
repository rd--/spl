# Timer

Returns time since last triggered.

_Timer(trig)_

Using timer to modulate sine frequency, the slower the trigger is the higher the frequency:

```
let x = MouseX(0.5, 20, 1, 0.2);
let trig = Impulse(x, 0);
SinOsc([x * 20 + 100, Timer(trig) * 500 + 500], 0) * 0.1
```

* * *

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Timer.html)

Categories: Ugen
