/* Bouncing objects (Jmcc) #2 */
{
	let impFreq = XLine(3 + Rand(0, 2), 600, 4);
	let impAmp = XLine(0.01 + Rand(0, 0.09), 0.000009, 4);
	let imp = Impulse(impFreq, 0) * impAmp;
	let exc = Decay(imp, 0.001);
	let fltFreq = { 400 + Rand(0, 8000) } ! 4;
	let fltAmp = { Rand(0, 1) } ! 4;
	let fltRtm = { 0.01 + Rand(0, 0.1) } ! 4;
	let flt = RingzBank(exc, fltFreq, fltAmp, fltRtm);
	EqPan(Release(flt, 0, 3, 0.001), Rand(-1, 1))
}.spawnTextureProgram {
	(0.6 -- 1.2).atRandom
}
