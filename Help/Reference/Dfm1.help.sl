# Dfm1

- _Dfm1(in, freq=1000, res=0.1, inputGain=1, type=0, noiseLevel=0.0003)_

Digitally modelled analog filter
It provides low-pass and high-pass filtering.
The filter can be overdriven and will self-oscillate at high resonances.

- in: input signal
- freq: cutoff frequency
- res: resonance
- inputGain: gain applied to the input signal
- type: set to 0 for low-pass or 1 for high-pass
- noiseLevel: amplitude of noise added to the model

Mouse control of frequency & resonance, noise input:

```
Dfm1(
	PinkNoise() * 0.2,
	MouseX(80, 5000, 1, 0.2),
	MouseY(0.1, 1.2, 0, 0.2),
	2,
	0,
	0.0003
)
```

Lfo control of frequency, pulse input:

```
let in = Pulse([100 100.1], 0.5).Sum * 0.4;
let freq = SinOsc(
	SinOsc(0.3, 0).LinLin(-1, 1, 0.2, 5),
	0
).LinLin(-1, 1, 80, 2000);
Dfm1(in, freq, 1.1, 2, 0, 0.0003) * 0.2
```

* * *

See also: MoogFf

Categories: Ugen, Filter
