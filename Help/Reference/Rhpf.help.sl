# Rhpf

- _Rhpf(in, freq, q)_

A resonant high pass filter.

- in: input signal to be processed
- freq: cutoff frequency.
- rq: the reciprocal of Q. bandwidth / cutoffFreq.

Modulate frequency:

```
Rhpf(
	Saw(200) * 0.1,
	SinOsc(XLine(0.7, 300, 20), 0) * 3600 + 4000,
	0.2
)
```

* * *

See also: Formlet, Rlpf, Resonz, Ringz

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/RHPF.html)

Categories: Ugen
