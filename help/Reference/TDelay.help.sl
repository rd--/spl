# TDelay

- _TDelay(trigger, delayTime)_

Trigger delay.
Delays a trigger by a given time.
Any triggers which arrive in the time between an input trigger and its delayed output, are ignored.

- trigger: input trigger signal.
- delayTime: delay time in seconds.

Impulse runs faster than flip flop:

```
let z = Impulse(2, 0);
[z, ToggleFf(TDelay(z, 0.5)) * SinOsc(440, 0)] * 0.1
```

Dust runs faster than flip flop:

```
let z = Dust(5);
[z, ToggleFf(TDelay(z, 0.5)) * SinOsc(440, 0)] * 0.1
```

* * *

See also: Delay1, Delay2, DelayC

Categories: Ugen
