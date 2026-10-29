# pulse

- _pulse(freq=440, width=0.5)_

Band limited pulse wave generator with pulse width modulation.

- freq: frequency in Hertz
- width: pulse width ratio from zero to one, 0.5 makes a square wave.

Modulate frequency:

~~~spl syn=A
pulse(xLine(40, 4000, 6), 0.1) * 0.1
~~~

Modulate pulse width:

~~~spl syn=B
pulse(200, line(0.01, 0.99, 8)) * 0.1
~~~

Two band limited square waves thru a resonant low pass filter:

~~~spl syn=C
rlpf(
	pulse([100, 250], 0.5) * 0.1,
	xLine(8000, 400, 5),
	0.05
)
~~~

* * *

See also: lfPulse, saw, sinOsc

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pulse.html),
_W_
[1](https://en.wikipedia.org/wiki/Pulse_wave)

Categories: Ugen, Oscillator
