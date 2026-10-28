/* rhpf ; requires=ListedEnv */
let tr = impulse(1 / [3 5 7 9], 0);
rhpf(
	pinkNoise() * decay2(tr, 3, mouseX(3, 27, 0, 0.2)),
	tLine(300, [3 9 12 15] * 1000, 3, tr),
	mouseY(0.1, 1, 0, 0.2)
).splay * 0.2
