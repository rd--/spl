# rand

- _rand(lo=0, hi=1)_

Random number generator.
Generates a single random float value in uniform distribution from lo to hi.
It generates this when the `SynthDef` first starts playing, and remains fixed.

```
{
	let freq = rand(200, 800);
	let dur = (1 / freq) * 7500;
	sinOsc(freq, 0) * line(0.2, 0, 1)
} !^ 5
```

* * *

See also: rand0, rand2, tRand, whiteNoise

Guides: Random Number Generators

References:
_Csound_
[1](http://csound.com/docs/manual/random.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Rand.html)

Categories: Ugen
