# SinOscFb -- Feedback Fm oscillator

_SinOscFb(freq, feedback)_

SinOscFb is a sine oscillator that has phase modulation feedback; its output plugs back into the phase input.
Basically this allows a modulation between a sine wave and a sawtooth like wave.
Overmodulation causes chaotic oscillation.
It may be useful if you want to simulate feedback Fm synths.

```
{ :tr |
	let x = MouseX(0.15, 0.85, 0, 0.2);
	let f0 = Choose(tr, [110 220 440]);
	{
		let freq = f0 + TRand(0, f0, tr);
		let fb = LfNoise2(1).LinLin(-1, 1, 0, x);
		EqPan(SinOscFb(freq, fb), TRand(-1, 1, tr)) / 16
	} !+ 16
}.OverlapTexture(2, 6, 3).Mix
```

Non-graph variant:

	{
		let x = MouseX(0.15, 0.85, 0, 0.2);
		let f0 = [110 220 440].atRandom;
		{
			let freq = f0 + Rand(0, f0);
			let fb = LfNoise2(1).LinLin(-1, 1, 0, x);
			EqPan(SinOscFb(freq, fb), Rand(-1, 1)) / 16
		} !+ 16
	}.overlap(2, 6, 3)
