/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/130117soft */
[
	{
		let amp = LfNoise2(0.6).LagUd(0, 15);
		let src = WhiteNoise() * amp;
		let pan = LfNoise2(0.1);
		let flt = Bpf(src, LfNoise2(0.2).ExpRange(500, 5000), 0.1);
		EqPan2(flt, pan)
	},
	{
		let amp = LfNoise2(0.6).LagUd(0, 15);
		let src = BrownNoise() * amp;
		let pan = LfNoise2(0.1);
		EqPan2(src, pan)
	},
	{
		let amp = LfNoise2(0.6).LagUd(0, 15);
		let src = PinkNoise() * amp;
		let pan = LfNoise2(0.1);
		let flt = Bpf(src, LfNoise2(0.2).ExpRange(500, 5000), 0.4);
		EqPan2(flt, pan)
	},
	{
		let amp = LfNoise2(0.6).LagUd(0, 15);
		let src = GrayNoise() * amp;
		let pan = LfNoise2(0.1);
		let flt = Bpf(src, LfNoise2(0.2).ExpRange(500, 5000), 1);
		EqPan2(flt, pan)
	}
].collect(value:/1).Sum / 3

/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft */
Bpf(
	WhiteNoise(0.2 # 2, 0),
	LfNoise2(0.4).ExpRange(880, 920),
	0.001
) * 7
