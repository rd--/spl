# decay

- _decay(in, decayTime=1)_

Exponential decay.
This is essentially the same as `integrator` except that instead of supplying the coefficient directly, it is caculated from a 60 dB decay time.
This is the time required for the integrator to lose 99.9 % of its value or -60dB.
This is useful for exponential decaying envelopes triggered by impulses.

- in: input signal
- decayTime: 60 dB decay time in seconds.

decay time of one centisecond:

~~~spl syn=A
decay(impulse(1, 0) * 0.25, 0.01)
~~~

Used as an envelope:

~~~spl syn=B
decay(
	impulse(xLine(1, 50, 20), 0) * 0.25,
	0.2
) * pinkNoise()
~~~

* * *

See also: decay2

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Decay.html)

Categories: Ugen, Envelope
