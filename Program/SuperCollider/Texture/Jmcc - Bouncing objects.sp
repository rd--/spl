/* Bouncing objects (Jmcc) #2 */
{
	let impFreq = XLine(3 + 2.Rand0, 600, 4);
	let impAmp = XLine(0.01 + 0.09.Rand0, 0.000009, 4);
	let imp = Impulse(impFreq, 0) * impAmp;
	let exc = Decay(imp, 0.001);
	let fltFreq = { 400 + 8000.Rand0 } ! 4;
	let fltAmp = { 1.Rand0 } ! 4;
	let fltRtm = { 0.01 + 0.1.Rand0 } ! 4;
	let flt = RingzBank(exc, fltFreq, fltAmp, fltRtm);
	EqPan(Release(flt, 0, 3, 0.001), 1.Rand2)
}.spawnTextureProgram {
	(0.6 -- 1.2).atRandom
}
