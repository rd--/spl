# SinOscFb -- Feedback Fm oscillator

_SinOscFb(freq, feedback)_

SinOscFb is a sine oscillator that has phase modulation feedback; its output plugs back into the phase input.
Basically this allows a modulation between a sine wave and a sawtooth like wave.
Overmodulation causes chaotic oscillation.
It may be useful if you want to simulate feedback Fm synths.

```
{
	var x = MouseX(0.15, 0.85, 0, 0.2);
	var f0 = [110 220 440].atRandom;
	{
		var freq = f0 + f0.Rand;
		var fb = LinLin(LfNoise2(1), -1, 1, 0, x);
		EqPan(SinOscFb(freq, fb), Rand(-1, 1)) / 16
	} !+ 16
}.overlap(2, 6, 3)
```

Graph variant:

```
{ :tr |
	var x = MouseX(0.15, 0.85, 0, 0.2);
	var f0 = Choose(tr, [110 220 440]);
	{
		var freq = f0 + Rand(tr, 0, f0);
		var fb = LinLin(LfNoise2(1), -1, 1, 0, x);
		EqPan(SinOscFb(freq, fb), Rand(tr, -1, 1)) / 16
	} !+ 16
}.OverlapTexture(2, 6, 3).Mix
```
