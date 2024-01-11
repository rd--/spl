{- Cymbalism accelerando (Jmcc) #2 -}
{
	let p = 15; {- number of partials per channel per 'cymbal' -}
	let f1 = 500 + 2000.Rand0;
	let f2 = 8000.Rand0;
	let tf = XLine(LinRand(0, 4, 0) + 0.5, 35.Rand0 + 0.5, 12);
	let t = Impulse(tf, 0);
	{
		RingzBank(
			Decay(t, 0.004) * WhiteNoise() * 0.02,
			{ f1 + f2.Rand0 } ! p,
			nil,
			{ Rand(1, 4) } ! p
		)
	} ! 2
}.xfade(4, 4)
