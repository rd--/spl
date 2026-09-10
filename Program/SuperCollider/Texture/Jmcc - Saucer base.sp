/* Saucer base (Jmcc) #6 */
{
	let b = Rand(0, 1000);
	let c = Rand(0, 5000);
	let o1 = SinOsc(Rand(0, 20), 0) * b + (1.1 * b);
	let o2 = SinOsc(o1, 0) * c + (1.1 * c);
	EqPan(SinOsc(o2, 0), Rand(-1, 1)) * 0.1
}.overlapTextureProgram(6, 2, 4)
