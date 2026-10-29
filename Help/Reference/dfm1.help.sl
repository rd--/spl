# dfm1

- _dfm1(in, freq=1000, res=0.1, inputGain=1, type=0, noiseLevel=0.0003)_

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

~~~spl syn=A
dfm1(
	pinkNoise() * 0.2,
	mouseX(80, 5000, 1, 0.2),
	mouseY(0.1, 1.2, 0, 0.2),
	2,
	0,
	0.0003
)
~~~

Lfo control of frequency, pulse input:

~~~spl syn=B
let in = pulse([100 100.1], 0.5).sum * 0.4;
let freq = sinOsc(
	sinOsc(0.3, 0).linLin(-1, 1, 0.2, 5),
	0
).linLin(-1, 1, 80, 2000);
dfm1(in, freq, 1.1, 2, 0, 0.0003) * 0.2
~~~

* * *

See also: moogFf

Guides: Unit Generators

Categories: Ugen, Filter
