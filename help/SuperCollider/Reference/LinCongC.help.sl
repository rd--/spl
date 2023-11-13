# LinCongC -- linear congruential generator

_LinCongC(freq=22050, a=1.1, c=0.13, m=1.0, xi=0)_

Linear congruential generators are often used to implement random number generators. However the number series they generate are cyclic. There are 'good' and 'bad' choices for the parameters if one wants to have a good random number series. However the real point of this UGen is to experiment and use the function as something between an oscillator and a noise source. The formula is _x1 = ((a * x0) + c) % m_.

All of the parameters are integers and cannot be modulated.

- a: a multiplier.
- c: an offset.
- m: the modulus of the series.
- xi: the seed value for the generator.

Default parameters:

	LinCongC(22050, 1.1, 0.13, 1.0, 0) * 0.1

Texture:

	{ :tr |
		var freq = SampleRate() / 2;
		var m = IRand(tr, 0, 1000000);
		var a = IRand(tr, 1, 2000);
		var c = IRand(tr, 1, 30000);
		LinCongC(freq, a, c, m, { IRand(tr, 0, m) } ! 2) * 0.05
	}.OverlapTexture(1, 2, 4).Mix
