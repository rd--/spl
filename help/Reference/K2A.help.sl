# K2A

- _K2A(in)_

Control rate to audio rate converter.
Control rate signals are not legal outputs.
If you want to output a control signal you need to convert it to audio rate.
K2A converts via linear interpolation.

- in: input signal

Control rate white noise interpolated to audio rate:

```
K2A(WhiteNoise().kr * 0.2)
```

* * *

See also: kr

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/K2A.html)
