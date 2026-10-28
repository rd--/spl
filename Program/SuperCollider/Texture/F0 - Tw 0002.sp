/* https://sccode.org/1-4Qy ; F0 ; 0002 */
{
	let o = bpf(
		impulse(linRand(0.5, 18.5, 0), 0),
		linRand(0, 9999, 0),
		linRand(0, 0.3, 0)
	) * 5;
	release(eqPan(o, rand(-1, 1)), 0, 3, 9)
}.spawnTextureProgram {
	(2 -- 3).atRandom
}
