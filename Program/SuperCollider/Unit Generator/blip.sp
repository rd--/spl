/* blip */
let ln = line(1, 20, 60);
let gate = lfPulse(ln, 0, 0.23) > 0;
blip(tRand(100, 1000, gate), tRand(1, 10, gate)) * asr(gate, 0.01, 1 / ln, -4) * 0.25

/* blip */
let ln = line(1, 20, 60);
let tr = impulse(ln, 0);
blip(tRand(100, 1000, tr), tRand(1, 10, tr)) * perc(tr, 0.01, 1 / ln, -4) * 0.25

/* blip */
blip(
	mouseX([3, 12], 1, 0, 0.2),
	mouseY([100, 1000], 1, 0, 0.2)
) * 0.1

/* blip ; Event control */
voicer(1, 16) { :e |
	let o = blip((e.x * 13 + 48).midiCps, e.y * 19 + 1);
	eqPan2(o, e.i * 2 - 1) * e.z * e.w * 0.5
}.mix

/* blip ; requires=keywords */
blip(
	freq: mouseX([3, 12], 1, 0, 0.2),
	numHarm: mouseY([100, 1000], 1, 0, 0.2)
) * 0.1
