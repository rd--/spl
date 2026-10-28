/* A bath (Jrhb) ; requires=SelectX */
let above = mouseY(0, 2, 0, 0.2).round(1);
let aside = mouseX(1, 1.6, 0, 0.2);
let sources = [
	whiteNoise([0.3] # 2, 0),
	pinkNoise([1] # 2, 0),
	lfdNoise3(10000) * 0.1
];
let u1 = selectX(lfdNoise1(4).linLin(-1, 1, 0, sources.size), sources) * 0.1;
let u2 = u1 + delayN(u1, 0.1, [0.001, 0.0012]) * 0.1;
let u3 = { rlpf(u2, { rand(100.0, 340) * aside } ! 4, 0.2).sum } ! 2;
let u4 = combL(u3.reverse, 0.05, 0.05, 0.3) * 0.3 * lfNoise2(0.2).max(0) + u3;
selectX(lag(above, 0.4), [u2, u4]) * 2
