# Bpf

- _Bpf(in, freq=440, rq=1)_

Second order Butterworth bandpass filter.

- in: input signal to be processed
- freq: cutoff frequency in Hertz.
- rq: the reciprocal of Q. bandwidth / cutoffFreq.

Modulate frequency:

```
Bpf(
	Saw(200) * 0.5,
	SinOsc(
		XLine(0.7, 300, 20),
		0
	) * 3600 + 4000,
	0.3
)
```

* * *

See also: Brf, Hpf, Lpf

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/butterbp.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/BPF.html),
_W_
[1](https://en.wikipedia.org/wiki/Butterworth_filter)
[2](https://en.wikipedia.org/wiki/Band-pass_filter)

Categories: Ugen, Filter
