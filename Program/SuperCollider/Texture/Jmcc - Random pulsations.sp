/* Random pulsations (Jmcc) #1 */
{
	let o1 = sinOsc(rand(0, 2000), 0) * 0.02;
	let o2 = sinOsc(linRand(8, 88, 0), 0);
	let o3 = sinOsc(0.3 + rand(0, 0.5), rand(0, 2.pi)) * 0.7;
	eqPan(release(o1, 2, 5, 2).amClip(o2), o3)
}.spawnTextureProgram { 9 / 8 }
