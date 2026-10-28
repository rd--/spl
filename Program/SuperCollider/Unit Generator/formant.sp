/* formant */
let r = (11 * rand(-0.2, 0.2).exp).fold(1, 30);
formant(r, expRand(200, 3000), rand(0, 9) * r + r) * 0.05

/* formant ; Event control */
Voicer(1, 16) { :e |
	let f0 = [200 300 400 500] * e.x;
	let ff = linExp(e.y, 0, 1, 400, 1200);
	splay2(formant(f0, ff, 200) * lagUd(e.w, 0.01, 1) * e.z)
}.mix
