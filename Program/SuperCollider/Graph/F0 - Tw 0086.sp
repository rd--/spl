/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ ; 0086 */
let a = LfNoise2(1 / (9 .. 17)).kr;
Splay2(
	Ringz(
		Bpf(
			Dust2(a.Abs * 10000),
			a.LinExp(-1, 1, 99, 10000),
			1.1 - a
		),
		(9 .. 1) * 99,
		a + 1.1
	) * a / 5
)
