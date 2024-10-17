/* Vosim */
{ :tr |
	{
		Vosim(
			Impulse(110 + TRand(-1, 1, tr), 0),
			TExpRand(110, 880, tr),
			TChoose(tr, [3 5 7]),
			TChoose(tr, [0.77 0.88 0.99])
		)
	} ! 2
}.OverlapTexture(3, 5, 3).Mix * 0.1

/* Vosim */
let p = TRand(0, 1, Impulse([3, 7], 0));
let tr = Impulse([9, 27] * (1 + (p > 0.95)), 0);
let f = TRand([40, 120, 220], [440, 990, 880], tr);
let n = TRand(2, [4, 8, 12], tr);
let d = TRand([0.2, 0.4, 0.6], [0.6, 0.8, 1], tr);
let a = TRand(0, [0.2, 0.6, 1], tr);
let l = TRand(-1, 1, tr);
let x = MouseX(0.25, 2, 0, 0.2);
let y = MouseY(0.25, 0.85, 0, 0.2);
let z = 9;
let freq = f * x * LinLin(LfNoise2(z), -1, 1, 0.25, 2);
let decay = d * y * LinLin(LfNoise2(z), -1, 1, 0.25, 2);
EqPan2(
	(Vosim(tr, freq, n, decay) * a).Sum,
	l
).Mix * 0.25

/* Vosim ; requires=voicer */
Voicer(1, 16) { :e |
	let tr = Impulse(e.p.UnitCps, 0);
	let freq = LinExp(e.y, 0, 1, 440, 880);
	EqPan2(Vosim(tr, freq, e.k + 1 * e.y * 12, e.j), e.i * 2 - 1) * e.w * e.z
}.Mix
