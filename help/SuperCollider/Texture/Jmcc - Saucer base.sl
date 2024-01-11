{- Saucer base (Jmcc) #6 -}
{
	let b = 1000.Rand0;
	let c = 5000.Rand0;
	let o1 = SinOsc(20.Rand0, 0) * b + (1.1 * b);
	let o2 = SinOsc(o1, 0) * c + (1.1 * c);
	EqPan(SinOsc(o2, 0), 1.Rand2) * 0.1
}.overlap(6, 2, 4)
