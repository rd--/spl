/* https://sccode.org/1-4Qy ; F0 ; 0100 */
{
	let z = iRand(1, 9) * 99;
	let a = delayN(lpf(inFb(2, 0), z), 0.2, 0.2);
	release(sinOsc(z + [0, 3], a.pi) / 5, 0, 6, 9)
}.spawnTextureProgram { 6 }
