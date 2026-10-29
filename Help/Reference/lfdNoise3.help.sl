# lfdNoise3

- _lfdNoise3(freq)_

Dynamic cubic noise.

- freq: rate at which to generate random values.

Similar to _lfNoise2_, it generates polynomially interpolated random values at a rate given by the freq argument, with three differences:

- no time quantization
- fast recovery from low freq values
- cubic instead of quadratic interpolation

Use as frequency control:

~~~spl syn=A
sinOsc(
	lfdNoise3(4) * 400 + 450,
	0
) * 0.2
~~~

* * *

See also: LfNoise3

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFDNoise3.html)

Categories: Ugen
