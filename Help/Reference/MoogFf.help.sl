# MoogFf

- _MoogFf(in, freq=100, gain=2, reset=0)_

Moog Vcf implementation, designed by Federico Fontana.

- in: the input signal
- freq: the cutoff frequency
- gain: the filter resonance gain, between zero and 4
- reset: when greater than zero, this will reset the state of the digital filters at the beginning of a computational block.

Mouse control of frequency & gain, noise input:

```
MoogFf(
	WhiteNoise() * 0.1,
	MouseX(100, 10000, 1, 0.2),
	MouseY(0, 4, 0, 0.2),
	0
)
```

Lfo control of frequency, pulse input:

```
let in = Pulse([40 121], [0.3 0.7]) * 0.4;
let freq = SinOsc(
	LfNoise0(0.42).LinLin(-1, 1, 0.01, 2.2),
	0
).LinLin(-1, 1, 30, 4200);
MoogFf(in, freq, 0.83 * 4, 0) * 0.5
```

* * *

See also: Dfm1

References:
Fontana, F. (2007)
"Preserving the Digital Structure of the Moog VCF".
In _Proc. ICMC_, Copenhagen, 25-31 August 2007.

Categories: Ugen, Filter
