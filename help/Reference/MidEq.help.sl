# MidEq

- _MidEq(in, freq=440, rq=1, db=0)_

Parametric filter.
Attenuates or boosts a frequency band.

- in: the input signal
- freq: center frequency of the band in hertz
- rq: the reciprocal of Q (bandwidth / cutoffFreq)
- db: amount of boost (db > 0) or attenuation (db < 0) of the frequency band

Mixer parametric Eq as effect:

```
MidEq(
	Saw(200) * 0.1,
	SinOsc(LfNoise2(1 / 3), 0).MulAdd(24, 84).MidiCps,
	0.3,
	12
)
```

Notch filter:

```
let in = PinkNoise() + SinOsc(600, 0) * 0.1;
MidEq(in, SinOsc(0.2, pi / 2) * 2 + 600, 0.01, -24)
```

* * *

See also: Bpf, Hpf, Lpf

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/MidEQ.html)

Categories: Ugen
