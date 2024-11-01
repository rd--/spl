/* Random pulsations (Jmcc) #1 */
{
	let o1 = SinOsc(2000.Rand0, 0) * 0.02;
	let o2 = SinOsc(LinRand(8, 88, 0), 0);
	let o3 = SinOsc(0.3 + 0.5.Rand0, 2 * pi.Rand0) * 0.7;
	EqPan(Release(o1, 2, 5, 2).AmClip(o2), o3)
}.spawnTextureProgram(9 / 8)
