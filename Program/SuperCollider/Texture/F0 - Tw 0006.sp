/* https://sccode.org/1-4Qy ; F0 ; 0006 */
{
	let n = moogFf(
		clipNoise() * 0.4,
		lfPar({ rand(0, 0.3) } ! 2, 0) * 600 + 990,
		2,
		0
	);
	let s = gVerb(n, 9, 9, 1, 0.5, 15, 1, 0.7, 0.5, 300).transpose.mix;
	release(s * 0.1, 3, 0, 19)
}.spawnTextureProgram { 3 }
