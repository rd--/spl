/* Saucer base (Jmcc) #6 */
{
	let b = rand(0, 1000);
	let c = rand(0, 5000);
	let o1 = sinOsc(rand(0, 20), 0) * b + (1.1 * b);
	let o2 = sinOsc(o1, 0) * c + (1.1 * c);
	eqPan(sinOsc(o2, 0), rand(-1, 1)) * 0.1
}.overlapTextureProgram(6, 2, 4)
