/* Random pulsations (Jmcc) #1 */
{
	let o1 = SinOsc(Rand(0, 2000), 0) * 0.02;
	let o2 = SinOsc(LinRand(8, 88, 0), 0);
	let o3 = SinOsc(0.3 + Rand(0, 0.5), Rand(0, 2.pi)) * 0.7;
	EqPan(Release(o1, 2, 5, 2).AmClip(o2), o3)
}.spawnTextureProgram(9 / 8)
