/* Cymbalism accellerando (Jmcc) #2 ; Graph rewrite */
let p = 15;
{ :tr |
	let i = impulse(
		txLine(
			tRand(0, 4, tr) + 0.5,
			tRand(0, 35, tr) + 0.5,
			12,
			tr
		),
		0
	);
	let s = decay(i, 0.004) * whiteNoise() * 0.03;
	let f1 = tRand(500, 2500, tr);
	let f2 = tRand(0, 8000, tr);
	{
		{
			ringz(s, f1 + tRand(0, f2, tr), tRand(1, 5, tr))
		} !+ p
	} ! 2
}.overlapTexture(4, 4, 3).mix * 0.1
