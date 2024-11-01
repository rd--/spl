/* Alien froggies ; Jmcc */
{
	let r = Fold(11 * 0.2.Rand2.Exp, 1, 30);
	Formant(r, ExpRand(200, 3000), 9.Rand0 * r + r) * 0.05
}.overlapTextureProgram(0.5, 0.25, 5)
