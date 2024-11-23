/* Cymbalism (Jmcc) #2 */
{
	let p = 15; /* number of partials per channel per 'cymbal' */
	let f1 = 500 + 2000.Rand0;
	let f2 = 8000.Rand0;
	let t = Impulse(3.Rand0 + 0.5, 0);
	let z = Decay(t, 0.004) * WhiteNoise() * 0.03;
	{
		RingzBank(
			z,
			{ f1 + f2.Rand0 } ! p, /* frequencies */
			nil, /* amplitudes default to 1.0 */
			{ 1 + 4.Rand0 } ! p /* ring times */
		)
	} ! 2
}.xFadeTextureProgram(4, 4)
