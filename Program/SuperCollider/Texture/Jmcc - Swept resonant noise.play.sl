/* Swept resonant noise (Jmcc) #2 */
{
	let p = 10; /* number of partials */
	let n = WhiteNoise() * 0.007;
	let f = (SinOsc(0.1 + 0.2.Rand0, 0) * (12 + 12.Rand2) + 60 + 24.Rand2).MidiCps;
	let sweep = Resonz(n, f, 0.1);
	{
		RingzBank(
			sweep,
			{ 80 + LinRand(0, 10000, 0) } ! p,
			nil,
			{ 0.5 + 2.Rand0 } ! p
		)
	} ! 2
}.overlapTextureProgram(4, 4, 5)
