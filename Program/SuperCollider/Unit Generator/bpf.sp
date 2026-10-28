/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/130117soft */
[
	{
		let amp = lfNoise2(0.6).lagUd(0, 15);
		let src = whiteNoise() * amp;
		let pan = lfNoise2(0.1);
		let flt = bpf(src, lfNoise2(0.2).expRange(500, 5000), 0.1);
		eqPan2(flt, pan)
	},
	{
		let amp = lfNoise2(0.6).lagUd(0, 15);
		let src = brownNoise() * amp;
		let pan = lfNoise2(0.1);
		eqPan2(src, pan)
	},
	{
		let amp = lfNoise2(0.6).lagUd(0, 15);
		let src = pinkNoise() * amp;
		let pan = lfNoise2(0.1);
		let flt = bpf(src, lfNoise2(0.2).expRange(500, 5000), 0.4);
		eqPan2(flt, pan)
	},
	{
		let amp = lfNoise2(0.6).lagUd(0, 15);
		let src = greyNoise() * amp;
		let pan = lfNoise2(0.1);
		let flt = bpf(src, lfNoise2(0.2).expRange(500, 5000), 1);
		eqPan2(flt, pan)
	}
].collect { :f/0 |
	f()
}.sum / 3

/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft */
bpf(
	whiteNoise([0.2] # 2, 0),
	lfNoise2(0.4).expRange(880, 920),
	0.001
) * 7
