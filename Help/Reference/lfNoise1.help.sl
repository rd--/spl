# lfNoise1

- _lfNoise1(freq=500)_

Ramp noise
Generates linearly interpolated random values at a rate given by the nearest integer division of the sample rate by the freq argument.

- freq: approximate rate at which to generate random values in Hertz

Fixed frequency:

~~~spl syn=A
lfNoise1(1000) * 0.05
~~~

Modulate frequency:

~~~spl syn=B
lfNoise1(xLine(1000, 10000, 10)) * 0.05
~~~

* * *

See also: lfNoise0, lfNoise2

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFNoise1.html)

Categories: Ugen
