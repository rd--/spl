/* 20061027 ; rd */
let h0 = {
	let f = 40;
	let h = henonN(
		[f, f * 0.5],
		lfNoise0(1) * 0.2 + 1.2,
		lfNoise0(1) * 0.15 + 0.15,
		0,
		0
	);
	saw(h * 3200 + 1600) * 0.35
};
let h1 = {
	let n = lfNoise0(2);
	let p = n.linLin(-1, 1, 2400, 3200);
	let o = blip(
		henonN(
			40,
			mouseX(1.2, 1.4, 0, 0.1),
			mouseY(0.2, 0.3, 0, 0.1),
			0,
			0
		).linLin(-1, 1, p, p * 2),
		lfNoise0(32).linLin(-1, 1, 1, 32)
	);
	eqPan(
		o,
		n.linLin(-1, 1, -0.75, 0.75)
	) * n.linLin(-1, 1, 0.55, 0.85) * 0.35
};
h0() + h1()
