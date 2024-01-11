{- Narrow band filtered crackle noise (Jmcc) #2 -}
{
	let rf1 = 80 + 2000.Rand0;
	let rf = XLine(rf1, rf1 * 0.2.Rand2 + rf1, 9);
	let c = Crackle(1.97 + 0.03.Rand0) * 0.15;
	EqPan(Release(Resonz(c, rf, 0.2), 2, 5, 2), 1.Rand2)
}.playEvery(2)
