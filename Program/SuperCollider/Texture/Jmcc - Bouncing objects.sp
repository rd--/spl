/* Bouncing objects (Jmcc) #2 */
{
	let impFreq = xLine(3 + rand(0, 2), 600, 4);
	let impAmp = xLine(0.01 + rand(0, 0.09), 0.000009, 4);
	let imp = impulse(impFreq, 0) * impAmp;
	let exc = decay(imp, 0.001);
	let fltFreq = { 400 + rand(0, 8000) } ! 4;
	let fltAmp = { rand(0, 1) } ! 4;
	let fltRtm = { 0.01 + rand(0, 0.1) } ! 4;
	let flt = ringzBank(exc, fltFreq, fltAmp, fltRtm);
	eqPan(release(flt, 0, 3, 0.001), rand(-1, 1))
}.spawnTextureProgram {
	(0.6 -- 1.2).atRandom
}
