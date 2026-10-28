/* Cymbalism accelerando (Jmcc) #2 */
{
	let p = 15; /* number of partials per channel per 'cymbal' */
	let f1 = 500 + rand(0, 2000);
	let f2 = rand(0, 8000);
	let tf = xLine(linRand(0, 4, 0) + 0.5, rand(0, 35) + 0.5, 12);
	let t = impulse(tf, 0);
	{
		ringzBank(
			decay(t, 0.004) * whiteNoise() * 0.02,
			{ f1 + rand(0, f2) } ! p,
			nil,
			{ rand(1, 4) } ! p
		)
	} ! 2
}.xFadeTextureProgram(4, 4)
