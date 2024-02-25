# DelayC

- _DelayC(in, maxDelayTime=0.2, delayTime=0.2)_

Simple delay line.
DelayN uses no interpolation, DelayL uses linear interpolation, DelayC uses cubic interpolation.

- in: the input signal.
- maxDelayTime: the maximum delay time in seconds. used to initialize the delay buffer size.
- delayTime: delay time in seconds.

Dust randomly triggers Decay to create an exponential decay envelope for the WhiteNoise input source, input is mixed with delay:

```
let z = Decay(Dust(1) * 0.5, 0.3) * WhiteNoise();
DelayC(z, 0.2, 0.2) + z
```

* * *

See also: DelayL, DelayN

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/DelayC.html)

Categories: Ugen, Delay
