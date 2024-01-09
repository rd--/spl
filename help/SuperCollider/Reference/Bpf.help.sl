# Bpf -- 2nd order Butterworth bandpass filter

_Bpf(in, freq=440, rq=1)_

A second order low pass filter.

- in: input signal to be processed
- freq: cutoff frequency in Hertz.
- rq: the reciprocal of Q. bandwidth / cutoffFreq.

Modulate frequency:

	Bpf(
		Saw(200) * 0.5,
		SinOsc(XLine(0.7, 300, 20), 0) * 3600 + 4000,
		0.3
	)

* * *

See also: Hpf, Lpf
