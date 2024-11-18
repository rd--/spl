# Rand

- _Rand(lo, hi)_

Random number generator.
Generates a single random float value in uniform distribution from lo to hi.
It generates this when the SynthDef first starts playing, and remains fixed.

```
{
	let freq = Rand(200, 800);
	let dur = (1 / freq) * 7500;
	SinOsc(freq, 0) * Line(0.2, 0, 1)
} !^ 5
```

* * *

See also: Rand0, Rand2, TRand, WhiteNoise

Guides: Random Number Generators

Categories: Ugen
