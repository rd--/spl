/* Cymbalism (Jmcc) #2 */
{
	let p = 15; /* number of partials per channel per 'cymbal' */
	let f1 = 500 + Rand(0, 2000);
	let f2 = Rand(0, 8000);
	let t = Impulse(Rand(0, 3) + 0.5, 0);
	let z = Decay(t, 0.004) * WhiteNoise() * 0.03;
	{
		RingzBank(
			z,
			{ f1 + Rand(0, f2) } ! p, /* frequencies */
			nil, /* amplitudes default to 1.0 */
			{ 1 + Rand(0, 4) } ! p /* ring times */
		)
	} ! 2
}.xFadeTextureProgram(4, 4)
