# lfPar

- _lfPar(freq, iphase)_

Parabolic oscillator.
A sine-like shape made of two parabolas and the integral of a triangular wave.
It has audible odd harmonics and is non-band-limited.
Output ranges from -1 to +1.

- freq: frequency in Hertz.
- iphase: initial phase offset. For efficiency reasons this is a value ranging from 0 to 4.

Fixed frequency oscillator:

~~~spl syn=A
lfPar([440, 800], 0) * 0.1
~~~

Modulating frequency:

~~~spl syn=B
lfPar(xLine(100, 2000, 10), 0) * 0.1
~~~

amplitude modulation:

~~~spl syn=C
lfPar(xLine(1, 200, 10), 0) * sinOsc(440, 0) * 0.1
~~~

Used as both oscillator and lfo:

~~~spl syn=D
lfPar(lfPar(3, 0.3) * 200 + 400, 0) * 0.1
~~~

Used as phase modulator (behaves like a triangular modulator in fm):

~~~spl syn=E
[
	sinOsc(440, lfPar(1, 2) * 8.pi),
	sinOsc(440 + (lfTri(1, 0) * 8.pi), 0)
] * 0.1
~~~

* * *

See also: lfCub, lfPar, lfPulse, lfSaw, lfTri

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFPar.html)
