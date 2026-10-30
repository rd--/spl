# lfNoise2

- _lfNoise2(freq=500)_

Quadratic noise.
Generates quadratically interpolated random values at a rate given by the nearest integer division of the sample rate by the freq argument.

- freq: approximate rate at which to generate random values.

Fixed frequency:

~~~spl syn=A
lfNoise2(1000) * 0.05
~~~

Modulate frequency:

~~~spl syn=B
lfNoise2(xLine(1000, 10000, 10)) * 0.05
~~~

* * *

See also: lfNoise0, lfNoise1

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFNoise2.html)
