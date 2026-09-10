/* Tapping tools (Jmcc) #7 */
{
	let rate = XLine(64, 0.125, 60);
	let exc = Decay(Impulse(LinRand(1, 20, 0) * rate, 0) * 0.03, 0.001);
	let flt = RingzBank(
		exc,
		{ 400 + Rand(0, 8000) } ! 4,
		nil,
		{ 0.01 + Rand(0, 0.1) } ! 4
	);
	let z = Release(EqPan(flt, Rand(-1, 1)) * 0.25, 1, 4, 1);
	3.timesRepeat {
		z := AllpassN(z, 0.05, { Rand(0, 0.05) } ! 2, 2)
	};
	z
}.spawnTextureProgram(2)
