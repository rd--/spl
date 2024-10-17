/* Coolant (Jmcc) #2 */
{
	let p = 10;
	let exc = OnePole(BrownNoise() * 0.002, 0.95);
	{ RingzBank(exc, { 40 + 2000.Rand0 } ! p, 1, 1) } ! 2
}.overlap(4, 4, 2)
