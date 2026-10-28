/* Tapping tools (Jmcc) #7 */
{
	let rate = xLine(64, 0.125, 60);
	let exc = decay(impulse(linRand(1, 20, 0) * rate, 0) * 0.03, 0.001);
	let flt = ringzBank(
		exc,
		{ 400 + rand(0, 8000) } ! 4,
		nil,
		{ 0.01 + rand(0, 0.1) } ! 4
	);
	let z = release(eqPan(flt, rand(-1, 1)) * 0.25, 1, 4, 1);
	3.timesRepeat {
		z := allpassN(z, 0.05, { rand(0, 0.05) } ! 2, 2)
	};
	z
}.spawnTextureProgram { 2 }
