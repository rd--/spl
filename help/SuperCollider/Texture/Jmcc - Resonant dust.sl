/* Resonant dust (Jmcc) #2 */
{ :currentTime |
	let rf1 = 2000.Rand0 + 80;
	let rf2 = rf1 + (0.5.Rand2 * rf1);
	let d = Dust(50 + 800.Rand0) * 0.3;
	let s = Resonz(d, XLine(rf1, rf2, 9), 0.1);
	EqPan(Release(s, 2, 5, 2), 1.Rand2).playAt(currentTime);
	2
}.schedule
