/* varSaw ; phase value = (0, 2.pi), offset to lowest and midpoint ascending */
varSaw(110, 1 * [0, 0.25], 0.5) * 0.1

/* varSaw ; per-note width modulation */
let d = linLin(lfNoise2(0.1), -1, 1, 0.05, 0.5);
let tr = impulse(1 / d, 0);
let w0 = tRand(0, 0.35, tr);
let w1 = tRand(0.65, 1, tr);
let w = phasor(tr, (w1 - w0) / sampleRate(), w0, w1, 0);
let o = varSaw(tRand(36, 72, tr).midiCps, 0, w) * decay2(tr, 0.1, d);
eqPan(o, tRand(-1, 1, tr)) / 7

/* varSaw (Jmcc) */
let f0 = 80;
let tr = impulse(4, 0) * 0.05;
let n = whiteNoise().*+(3, 3).round(0.5) + 1;
let f = lag(f0 * latch(n, tr), 0.03);
let osc = varSaw(
	f * [1, 1.004, 1.505, 1.499],
	0,
	mouseY(0, 1, 0, 0.2)
) * decay2(tr, 0.005, 1.4);
combN(osc.clump(2).mix * 0.5, 0.375, 0.375, 4).softClip
