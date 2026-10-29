# lfSaw

- _lfSaw(freq=440, phase=0)_

Sawtooth oscillator.
A non-band-limited sawtooth oscillator.
Output ranges from -1 to +1.

- freq: frequency in Hertz
- iphase: initial phase offset (0-2)

Fixed frequency:

~~~spl syn=A
lfSaw(500, 1) * 0.1
~~~

Used as both oscillator and lfo:

~~~spl syn=B
lfSaw(lfSaw(4, 0) * 400 + 400, 0) * 0.1
~~~

* * *

See also: lfPulse, lfTri, saw, sawtoothWave, syncSaw, varSaw

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFSaw.html)

Categories: Ugen
