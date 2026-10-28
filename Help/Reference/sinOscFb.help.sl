# sinOscFb

- _sinOscFb(freq=440, feedback=0)_

Feedback Fm oscillator.
sinOscFb is a sine oscillator that has phase modulation feedback;
its output plugs back into the phase input.
Basically this allows a modulation between a sine wave and a sawtooth like wave.
Overmodulation causes chaotic oscillation.
It may be useful if you want to simulate feedback Fm synths.

```
{ :tr |
	let x = mouseX(0.15, 0.85, 0, 0.2);
	let f0 = tChoose(tr, [110 220 440]);
	{
		let freq = f0 + tRand(0, f0, tr);
		let fb = lfNoise2(1).linLin(-1, 1, 0, x);
		eqPan(
			sinOscFb(freq, fb),
			tRand(-1, 1, tr)
		) / 16
	} !+ 16
}.overlapTexture(2, 6, 3).mix
```

Non-graph variant:

~~~spl texture
{
	let x = mouseX(0.15, 0.85, 0, 0.2);
	let f0 = [110 220 440].atRandom;
	{
		let freq = f0 + rand(0, f0);
		let fb = lfNoise2(1).linLin(-1, 1, 0, x);
		eqPan(
			sinOscFb(freq, fb),
			rand(-1, 1)
		) / 16
	} !+ 16
}.overlapTextureProgram(2, 6, 3)
~~~

* * *

See also: sinOsc

Guides: Unit Generators

Categories: Ugen
