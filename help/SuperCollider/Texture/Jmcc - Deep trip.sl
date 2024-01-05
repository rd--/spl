(* Deep Trip (Jmcc) #9 *)
{
	var f = (LfNoise1(0.3.Rand0) * 60 + 70).MidiCps;
	var a = Mul(
		LfNoise2(f * 0.5.Rand0),
		[
			LfNoise1(8.Rand0),
			SinOsc(40.Rand0, 0),
			0.1
		].product.Max(0)
	);
	var s = EqPan(SinOsc(f, 0) * a, LfNoise1(5.Rand0));
	var c = {
		CombN(s, 0.5, { Rand(0.2, 0.5) } ! 2, 20)
	} ! 2;
	s + c.Sum
}.overlap(12, 4, 4)
