/* Coolant (Jmcc) #2 */
{
	let p = 10;
	let exc = onePole(brownNoise() * 0.002, 0.95);
	{ ringzBank(exc, { 40 + rand(0, 2000) } ! p, 1, 1) } ! 2
}.overlapTextureProgram(4, 4, 2)
