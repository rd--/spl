/* Swept resonant noise (Jmcc) #2 */
{
	let p = 10; /* number of partials */
	let n = whiteNoise() * 0.007;
	let f = (sinOsc(0.1 + rand(0, 0.2), 0) * (12 + rand(-12, 12)) + 60 + rand(-24, 24)).midiCps;
	let sweep = resonz(n, f, 0.1);
	{
		ringzBank(
			sweep,
			{ 80 + linRand(0, 10000, 0) } ! p,
			nil,
			{ 0.5 + rand(0, 2) } ! p
		)
	} ! 2
}.overlapTextureProgram(4, 4, 5)
