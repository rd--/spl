/* Cymbalism (Jmcc) #2 */
{
	let p = 15; /* number of partials per channel per 'cymbal' */
	let f1 = 500 + rand(0, 2000);
	let f2 = rand(0, 8000);
	let t = impulse(rand(0, 3) + 0.5, 0);
	let z = decay(t, 0.004) * whiteNoise() * 0.03;
	{
		ringzBank(
			z,
			{ f1 + rand(0, f2) } ! p, /* frequencies */
			nil, /* amplitudes default to 1.0 */
			{ 1 + rand(0, 4) } ! p /* ring times */
		)
	} ! 2
}.xFadeTextureProgram(4, 4)
