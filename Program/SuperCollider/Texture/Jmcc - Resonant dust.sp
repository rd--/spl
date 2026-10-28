/* Resonant dust (Jmcc) #2 */
{
	let rf1 = rand(0, 2000) + 80;
	let rf2 = rf1 + (rand(-0.5, 0.5) * rf1);
	let d = dust(50 + rand(0, 800)) * 0.3;
	let s = resonz(d, xLine(rf1, rf2, 9), 0.1);
	eqPan(release(s, 2, 5, 2), rand(-1, 1))
}.spawnTextureProgram { 2 }
