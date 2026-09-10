/* https://sccode.org/1-4Qy ; F0 ; 0002 */
{
	let o = Bpf(
		Impulse(LinRand(0.5, 18.5, 0), 0),
		LinRand(0, 9999, 0),
		LinRand(0, 0.3, 0)
	) * 5;
	Release(EqPan(o, Rand(-1, 1)), 0, 3, 9)
}.spawnTextureProgram {
	(2 -- 3).atRandom
}
