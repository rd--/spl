# Decay

- _Decay(in, decayTime=1)_

Exponential decay.
This is essentially the same as `Integrator` except that instead of supplying the coefficient directly, it is caculated from a 60 dB decay time.
This is the time required for the integrator to lose 99.9 % of its value or -60dB.
This is useful for exponential decaying envelopes triggered by impulses.

- in: input signal
- decayTime: 60 dB decay time in seconds.

Decay time of one centisecond:

```
Decay(Impulse(1, 0) * 0.25, 0.01)
```

Used as an envelope:

```
Decay(
	Impulse(XLine(1, 50, 20), 0) * 0.25,
	0.2
) * PinkNoise()
```

* * *

See also: Decay2

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Decay.html)

Categories: Ugen, Envelope
