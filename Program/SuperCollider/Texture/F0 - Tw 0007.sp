/* https://sccode.org/1-4Qy ; F0 ; 0007 */
{
	let o = pluck(
		crackle([1.9 1.8]),
		impulse(iRand(1, 6), 0),
		0.05,
		linRand(0, 0.05, 0),
		1,
		0.5
	);
	release(bpf(o, iRand(0, 1200), 1), 9, 0, 69)
}.spawnTextureProgram { 9 }
