/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ ; 0086 */
let a = lfNoise2(1 / [9 .. 17]).kr;
splay2(
	ringz(
		bpf(
			dust2(a.abs * 10000),
			a.linExp(-1, 1, 99, 10000),
			1.1 - a
		),
		[9 .. 1; -1] * 99,
		a + 1.1
	) * a / 5
)
