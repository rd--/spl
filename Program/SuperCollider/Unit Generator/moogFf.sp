/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/130117soft */
moogFf(
	whiteNoise([0.2] # 2, 0),
	mouseX(100, 10000, 1, 0.2),
	lfNoise2(1).linLin(0, 1, 2, 3.8),
	0
)

/* MoogFF ; Voicer */
Voicer(1, 16) { :e |
	let freq = e.x.unitCps;
	let osc = {
		saw(freq * tRand(0.99, 1.01, e.w)) * 0.75
	} !+ 8;
	let filterEnv = adsr(e.w, 0.02, 0.1, 0.05, 1, -4);
	moogFf(osc, e.y * 750 + 250 * filterEnv, e.j * 4, 0) * e.w.lagUd(0.01, 4) * 2
}.splay
