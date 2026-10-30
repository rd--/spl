# fSinOsc

- _fSinOsc(freq=440, iphase=0)_

Fast sine oscillator.
Very fast sine wave generator (2 PowerPC instructions per output sample) implemented using a ringing filter.
This generates a much cleaner sine wave than a table lookup oscillator and is a lot faster.
However, the amplitude of the wave will vary with frequency.
Generally the amplitude will go down as you raise the frequency and go up as you lower the frequency.
_Warning_: In the current implementation, the amplitude can blow up if the frequency is modulated by certain alternating signals.

- freq: frequency in Hertz
- iphase: initial phase

Constant frequency:

~~~spl syn=A
fSinOsc(800, 0) * 0.25
~~~

Modulate frequency:

~~~spl syn=B
fSinOsc(xLine(200, 4000, 1), 0) * 0.25
~~~

Loses amplitude towards the end:

~~~spl syn=C
fSinOsc(
	fSinOsc(xLine(4, 401, 8), 0) * 200 + 800,
	0
) * 0.25
~~~

* * *

See also: osc, sinOsc

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/oscils.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/FSinOsc.html)
