# LfdNoise3

- _LfdNoise3(freq)_

Dynamic cubic noise.

- freq: rate at which to generate random values.

Similar to _LfNoise2_, it generates polynomially interpolated random values at a rate given by the freq argument, with three differences:

- no time quantization
- fast recovery from low freq values
- cubic instead of quadratic interpolation

Use as frequency control:

```
SinOsc(
	LfdNoise3(4) * 400 + 450,
	0
) * 0.2
```

* * *

See also: LfNoise3

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFDNoise3.html)

Categories: Ugen
