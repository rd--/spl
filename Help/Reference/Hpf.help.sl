# Hpf

- _Hpf(in, freq)_

2nd order Butterworth highpass filter.
A second order high pass filter.

- in: input signal to be processed
- freq: cutoff frequency

Modulate frequency, note makeup gain:

```
Hpf(
	Saw(200) * 0.1,
	SinOsc(XLine(0.7, 300, 20), 0) * 3600 + 4000
) * 2
```

* * *

See also: Bpf, Brf, Lpf

References:
_Csound_
[1](https://csound.com/docs/manual/butterhp.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/HPF.html),
_W_
[1](https://en.wikipedia.org/wiki/Butterworth_filter)
[2](https://en.wikipedia.org/wiki/High-pass_filter)

Categories: Ugen
