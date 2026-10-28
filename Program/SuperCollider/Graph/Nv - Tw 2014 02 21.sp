/* http://twitter.com/headcube/status/437094206767513600 2014-02-21 ; sometimes eventually unstable here (2021-09-24) */
let x = impulse(0.05, 0);
{
	20.timesRepeat {
		let a = allpassL(leakDc(x, 0.995), 4, 8 ^ lfNoise2(0.1) / 2, 8) * 1.2;
		x := lpf(a, 8 ^ lfNoise2({ rand(0, 0.1) } ! 2) * 2500).tanh
	};
	x * 0.5
} !+ 4
