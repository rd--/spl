(* cymbalism (jmcc) #2 *)
{
	var p = 15;
	var f1 = 500 + 2000.Rand0;
	var f2 = 8000.Rand0;
	var t = Impulse(3.Rand0 + 0.5, 0);
	var z = Decay(t, 0.004) * WhiteNoise() * 0.03;
	{
		RingzBank(
			z,
			{ f1 + f2.Rand0 } ! p,
			nil,
			{ 1 + 4.Rand0 } ! p
		)
	} ! 2
}.xfade(4, 4)
