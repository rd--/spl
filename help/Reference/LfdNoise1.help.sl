# LfdNoise1

- _LfdNoise1(freq=500)_

Dynamic ramp noise.
Like `LfNoise1`.
Generate linearly interpolated random values at a rate given by the freq argument,
with two differences:

- no time quantization
- fast recovery from low freq values

If you do not need very high or very low freqs, or use fixed freqs, LfNoise1 is more efficient.

- freq: approximate rate at which to generate random values

When moving mouse quickly LfNoise frequently seems stuck:

```
SinOsc(LfNoise1(MouseX(0.1, 1000, 1, 0.2)) * 200 + 500, 0) * 0.2
```

LfdNoise changes smoothly:

```
SinOsc(LfdNoise1(MouseX(0.1, 1000, 1, 0.2)) * 200 + 500, 0) * 0.2
```

* * *

See also: LfdNoise0, LfdNoise3, LfNoise1

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFDNoise1.html)
