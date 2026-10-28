# midEq

- _midEq(in, freq=440, rq=1, db=0)_

Parametric filter.
Attenuates or boosts a frequency band.

- in: the input signal
- freq: center frequency of the band in hertz
- rq: the reciprocal of Q (bandwidth / cutoffFreq)
- db: amount of boost (db > 0) or attenuation (db < 0) of the frequency band

Mixer parametric Eq as effect:

```
midEq(
	saw(200) * 0.1,
	sinOsc(lfNoise2(1 / 3), 0).*+(24, 84).midiCps,
	0.3,
	12
)
```

Notch filter:

```
let in = pinkNoise() + sinOsc(600, 0) * 0.1;
midEq(in, sinOsc(0.2, 0.5.pi) * 2 + 600, 0.01, -24)
```

* * *

See also: bpf, hpf, lpf

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/MidEQ.html)

Categories: Ugen
