# Decay2

- _Decay2(in, attackTime=0.01, decayTime=1)_

Exponential decay.
`Decay` has a very sharp attack and can produce clicks.
`Decay2` rounds off the attack by subtracting one `Decay` from another.
_Decay2(in, attackTime, decayTime)_ is equivalent to _Decay(in, decayTime) - Decay(in, attackTime)_.

- in: input signal
- attackTime: 60 dB attack time in seconds.
- decayTime: 60 dB decay time in seconds.

One millisecond attack, one centisecond decay:

```
Decay2(Impulse(1, 0), 0.001, 0.01)
```

Since attack and decay are a difference of two Decays, if you swap the values, then the envelope turns upside down:

```
Decay2(Impulse(1, 0), 0.01, 0.001)
```

Used as an envelope:

```
Decay2(
	Impulse(XLine(1, 50, 20), 0) * 0.25,
	0.01,
	0.2
) * FSinOsc(600, 0)
```

Compare the above with Decay used as the envelope:

```
Decay(
	Impulse(XLine(1, 50, 20), 0) * 0.25,
	0.2
) * FSinOsc(600, 0)
```

* * *

See also: Decay

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Decay2.html)

Categories: Ugen, Envelope
