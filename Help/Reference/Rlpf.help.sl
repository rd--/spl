# Rlpf

- _Rlpf(in, freq=440, rq=1)_

A resonant low pass filter.

- in: input signal to be processed
- freq: cutoff frequency
- rq: the reciprocal of Q, bandwidth / cutoffFreq

Modulate frequency:

```
Rlpf(
	Saw(200) * 0.1,
	SinOsc(XLine(0.7, 300, 20), 0) * 3600 + 4000,
	0.2
)
```

* * *

See also: Formlet, Resonz, Rhpf, Ringz

References:
_Csound_
[1](https://csound.com/docs/manual/lowpass2.html)
[2](https://csound.com/docs/manual/lowres.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/RLPF.html)

Categories: Ugen, Filter
