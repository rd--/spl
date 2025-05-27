# Brf

- _Brf(in, freq, rq)_

2nd order Butterworth band-rejection, or band-stop, filter.
A second order low pass filter.

- in: input signal to be processed
- freq: cutoff frequency in Hertz
- rq: the reciprocal of Q. bandwidth / cutoffFreq

Modulate frequency:

```
Brf(
	Saw(200) * 0.1,
	SinOsc(
		XLine(0.7, 300, 20),
		0
	) * 3800 + 4000,
	0.3
)
```

* * *

See also: Bpf, Hpf, Lpf

References:
_Csound_
[1](https://csound.com/docs/manual/butterbr.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/BRF.html),
_W_
[1](https://en.wikipedia.org/wiki/Butterworth_filter)
[2](https://en.wikipedia.org/wiki/Band-stop_filter)

Categories: Ugen, Filter
