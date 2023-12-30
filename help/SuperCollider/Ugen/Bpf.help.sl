(* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/130117soft *)
[
	{
		var amp = LfNoise2(0.6).LagUd(0, 15);
		var src = WhiteNoise() * amp;
		var pan = LfNoise2(0.1);
		var flt = Bpf(src, LfNoise2(0.2).ExpRange(500, 5000), 0.1);
		EqPan2(flt, pan)
	},
	{
		var amp = LfNoise2(0.6).LagUd(0, 15);
		var src = BrownNoise() * amp;
		var pan = LfNoise2(0.1);
		EqPan2(src, pan)
	},
	{
		var amp = LfNoise2(0.6).LagUd(0, 15);
		var src = PinkNoise() * amp;
		var pan = LfNoise2(0.1);
		var flt = Bpf(src, LfNoise2(0.2).ExpRange(500, 5000), 0.4);
		EqPan2(flt, pan)
	},
	{
		var amp = LfNoise2(0.6).LagUd(0, 15);
		var src = GrayNoise() * amp;
		var pan = LfNoise2(0.1);
		var flt = Bpf(src, LfNoise2(0.2).ExpRange(500, 5000), 1);
		EqPan2(flt, pan)
	}
].collect(value:/1).Sum / 3

(* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft *)
Bpf(
	{ WhiteNoise() } ! 2 * 0.2,
	LfNoise2(0.4).ExpRange(880, 920),
	0.001
) * 7
