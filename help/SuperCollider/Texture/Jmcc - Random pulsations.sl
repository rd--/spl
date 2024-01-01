(* random pulsations (jmcc) #1 *)
{
	var o1 = SinOsc(2000.Rand0, 0) * 0.02;
	var o2 = SinOsc(LinRand(8, 88, 0), 0);
	var o3 = SinOsc(0.3 + 0.5.Rand0, 2 * pi.Rand0) * 0.7;
	EqPan(Release(o1, 2, 5, 2).AmClip(o2), o3)
}.playEvery(9 / 8)
