# ZeroCrossing

- _ZeroCrossing(in)_

Zero crossing frequency follower.
Outputs a frequency based upon the distance between interceptions of the X axis.
The X intercepts are determined via linear interpolation so this gives better than just integer wavelength resolution.
This is a very crude pitch follower, but can be useful in some situations.

- in: input signal.

Track frequency of sine oscillator:

```
let a = SinOsc(SinOsc(1, 0) * 600 + 700, 0) * 0.1;
[a, ZeroCrossing(a) * 0.0005]
```

* * *

See also: Pitch

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ZeroCrossing.html)

Categories: Ugen
