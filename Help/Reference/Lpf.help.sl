# Lpf

- _Lpf(in, freq)_

2nd order Butterworth lowpass filter.
A second order low pass filter.

- in: input signal to be processed
- freq: cutoff frequency.

Modulate frequency:

```
Lpf(
	Saw(200) * 0.1,
	SinOsc(XLine(0.7, 300, 20), 0) * 3600 + 4000
)
```

* * *

See also: Bpf, Brf, Hpf

References:
_Csound_
[1](https://csound.com/docs/manual/butterlp.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/LPF.html),
_W_
[1](https://en.wikipedia.org/wiki/Butterworth_filter)
[2](https://en.wikipedia.org/wiki/Low-pass_filter)

Categories: Ugen, Filter
