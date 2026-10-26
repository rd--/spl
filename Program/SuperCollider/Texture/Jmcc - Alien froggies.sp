/* Alien froggies ; Jmcc */
{
	let r = (11 * Rand(-0.2, 0.2).exp).fold(1, 30);
	Formant(r, ExpRand(200, 3000), Rand(0, 9) * r + r) * 0.05
}.overlapTextureProgram(0.5, 0.25, 5)
