# lfTri

- _lfTri(freq=440, phase=0)_

Triangle wave oscillator.
A non-band-limited triangle wave oscillator.
Output ranges from -1 to +1.

- freq: frequency in Hertz
- iphase: initial phase offset. For efficiency reasons this is a value ranging from 0 to 4.

Constant frequency:

~~~spl syn=A
lfTri([440, 800], 0) * 0.1
~~~

Used as both Oscillator and Lfo:

~~~spl syn=B
lfTri(lfTri(1, 0) * 400 + 400, 0) * 0.1
~~~

* * *

See also: lfPulse, lfSaw

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFTri.html)

Categories: Ugen
