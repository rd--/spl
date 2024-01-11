{- Alien meadow ; Jmcc ; #6 -}
{
	let b = Rand(0, 5000);
	let o1 = SinOsc(Rand(0, 20), 0) * (0.1 * b) + b;
	let o2 = SinOsc(Rand(0, 20), 0) * 0.05 + 0.05;
	EqPan(SinOsc(o1, 0) * o2, Rand(-1, 1))
}.overlap(6, 2, 6)
