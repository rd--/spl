{- Tapping tools (Jmcc) #7 -}
{
	let rate = XLine(64, 0.125, 60);
	let exc = Decay(Impulse(LinRand(1, 20, 0) * rate, 0) * 0.03, 0.001);
	let flt = RingzBank(
		exc,
		{ 400 + 8000.Rand0 } ! 4,
		nil,
		{ 0.01 + 0.1.Rand0 } ! 4
	);
	let z = Release(EqPan(flt, 1.Rand2) * 0.25, 1, 4, 1);
	3.timesRepeat {
		z := AllpassN(z, 0.05, { 0.05.Rand0 } ! 2, 2)
	};
	z
}.playEvery(2)
