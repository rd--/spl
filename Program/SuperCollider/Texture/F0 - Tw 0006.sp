/* https://sccode.org/1-4Qy ; F0 ; 0006 */
{
	let n = MoogFf(
		ClipNoise() * 0.4,
		LfPar({ 0.3.Rand0 } ! 2, 0) * 600 + 990,
		2,
		0
	);
	let s = GVerb(n, 9, 9, 1, 0.5, 15, 1, 0.7, 0.5, 300).transpose.Mix;
	Release(s * 0.1, 3, 0, 19)
}.spawnTextureProgram(3)
