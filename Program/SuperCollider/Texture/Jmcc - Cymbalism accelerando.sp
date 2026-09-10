/* Cymbalism accelerando (Jmcc) #2 */
{
	let p = 15; /* number of partials per channel per 'cymbal' */
	let f1 = 500 + Rand(0, 2000);
	let f2 = Rand(0, 8000);
	let tf = XLine(LinRand(0, 4, 0) + 0.5, Rand(0, 35) + 0.5, 12);
	let t = Impulse(tf, 0);
	{
		RingzBank(
			Decay(t, 0.004) * WhiteNoise() * 0.02,
			{ f1 + Rand(0, f2) } ! p,
			nil,
			{ Rand(1, 4) } ! p
		)
	} ! 2
}.xFadeTextureProgram(4, 4)
