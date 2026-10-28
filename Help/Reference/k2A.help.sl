# k2A

- _k2A(in)_

Control rate to audio rate converter.
Control rate signals are not legal outputs.
If you want to output a control signal you need to convert it to audio rate.
k2A converts via linear interpolation.

- in: input signal

Control rate white noise interpolated to audio rate:

```
k2A(whiteNoise().kr * 0.2)
```

* * *

See also: kr

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/K2A.html)

Categories: Ugen
