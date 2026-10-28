/* http://twitter.com/thormagnusson/status/463992770596577280 (tm) */
let k = 9 + 19.atRandom;
{
	[1 .. k].collect { :x |
		let e = lfNoise2(0.5) * line(0, 0.1, rand(0, 99)) / (x * 0.2);
		sinOsc(30 * x + linLin(lfNoise2(0.1), -1, 1, -2, 2), 0) * e
	}.sum
} ! 2
