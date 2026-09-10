/* Narrow band filtered crackle noise (Jmcc) #2 */
{
	let rf1 = 80 + Rand(0, 2000);
	let rf = XLine(rf1, rf1 * Rand(-0.2, 0.2) + rf1, 9);
	let c = Crackle(1.97 + Rand(0, 0.03)) * 0.15;
	EqPan(Release(Resonz(c, rf, 0.2), 2, 5, 2), Rand(-1, 1))
}.spawnTextureProgram(2)
