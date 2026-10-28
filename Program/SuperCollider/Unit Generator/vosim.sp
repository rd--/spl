/* vosim */
{ :tr |
	{
		vosim(
			impulse(110 + tRand(-1, 1, tr), 0),
			tExpRand(110, 880, tr),
			tChoose(tr, [3 5 7]),
			tChoose(tr, [0.77 0.88 0.99])
		)
	} ! 2
}.overlapTexture(3, 5, 3).mix * 0.1

/* vosim */
let p = tRand(0, 1, impulse([3, 7], 0));
let tr = impulse([9, 27] * (1 + (p > 0.95)), 0);
let f = tRand([40, 120, 220], [440, 990, 880], tr);
let n = tRand(2, [4, 8, 12], tr);
let d = tRand([0.2, 0.4, 0.6], [0.6, 0.8, 1], tr);
let a = tRand(0, [0.2, 0.6, 1], tr);
let l = tRand(-1, 1, tr);
let x = mouseX(0.25, 2, 0, 0.2);
let y = mouseY(0.25, 0.85, 0, 0.2);
let z = 9;
let freq = f * x * linLin(lfNoise2(z), -1, 1, 0.25, 2);
let decay = d * y * linLin(lfNoise2(z), -1, 1, 0.25, 2);
eqPan2(
	(vosim(tr, freq, n, decay) * a).sum,
	l
).mix * 0.25

/* vosim ; Event control */
Voicer(1, 16) { :e |
	let tr = impulse(e.p.unitCps, 0);
	let freq = linExp(e.y, 0, 1, 440, 880);
	eqPan2(vosim(tr, freq, e.k + 1 * e.y * 12, e.j), e.i * 2 - 1) * e.w * e.z
}.mix
