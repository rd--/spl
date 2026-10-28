/* resonz ; resonator */
{ :tr |
	resonz(
		pulse(tRand(2, 7, tr), 0.5),
		{ tExpRand(120, 2500, tr) } ! 4,
		0.005
	).splay2
}.overlapTexture(2, 4, 6).mix

/* resonz */
resonz(whiteNoise() * 0.5, 2000, 0.1)

/* resonz ; modulate frequency ; sinOsc */
let f = sinOsc(0.5, 0) * 40 + 220;
resonz(whiteNoise(), f, 0.1)

/* resonz ; modulate frequency ; xLine */
let f = xLine(1000, 8000, 10);
resonz(whiteNoise() * 0.1, f, 0.05)

/* resonz ; modulate bandwidth */
let bw = xLine(1, 0.001, 8);
resonz(whiteNoise() * 0.1, 2000, bw)

/* resonz ; modulate bandwidth opposite direction */
let bw = xLine(0.001, 1, 8);
resonz(whiteNoise() * 0.1, 2000, bw)

/* resonz ; pinkNoise ; Event control */
voicer(1, 16) { :e |
	eqPan2(
		resonz(
			pinkNoise(),
			e.p.unitCps,
		e.y * 0.25) * 24,
		e.i * 2 - 1
	) * e.z * e.w
}.mix

/* resonz ; pinkNoise ; Event control */
voicer(1, 16) { :e |
	let env = perc(e.w, 0.01, 1 + e.j, -4);
	let freq = e.p.unitCps;
	let rq = linLin(e.y, 0, 1, 0.05, 0.25) / freq;
	let scl = 900;
	eqPan2(resonz(pinkNoise(), freq, rq) * scl * e.z, e.i * 2 - 1) * env
}.mix
