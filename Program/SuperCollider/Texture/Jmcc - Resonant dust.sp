/* Resonant dust (Jmcc) #2 */
{
	let rf1 = Rand(0, 2000) + 80;
	let rf2 = rf1 + (Rand(-0.5, 0.5) * rf1);
	let d = Dust(50 + Rand(0, 800)) * 0.3;
	let s = Resonz(d, XLine(rf1, rf2, 9), 0.1);
	EqPan(Release(s, 2, 5, 2), Rand(-1, 1))
}.spawnTextureProgram(2)
