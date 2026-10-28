/* Alien meadow ; Jmcc ; #6 */
{
	let b = rand(0, 5000);
	let o1 = sinOsc(rand(0, 20), 0) * (0.1 * b) + b;
	let o2 = sinOsc(rand(0, 20), 0) * 0.05 + 0.05;
	eqPan(sinOsc(o1, 0) * o2, rand(-1, 1))
}.overlapTextureProgram(6, 2, 6)
