/* pmOsc ; Mouse control */
pmOsc(440, mouseY(1, 550, 0, 0.2), mouseX(1, 15, 0, 0.2), 0) * 0.1

/* pmOsc ; Carrier and modulator not linked */
let tr = impulse(10, 0);
let c = tRand(100, 5000, tr);
let m = tRand(100, 5000, tr);
pmOsc(c, m, 12, 0) * 0.1

/* pmOsc ; Modulator expressed as ratio */
let carrier = lfNoise0(mouseY(3, 11, 0, 0.2)) * 500 + 700;
let modRatio = mouseX(1, 2, 0, 0.2);
pmOsc(carrier, carrier * modRatio, 12, 0) * 0.1

/* pmOsc ; Random parameters, linear modulation */
let dur = 6;
{ :tr |
	let cf = tRand(0, 2000, tr);
	let mf = tRand(0, 800, tr);
	let pme = tRand(0, 12, tr);
	let l1 = tRand(-1, 1, tr);
	let l2 = tRand(-1, 1, tr);
	let l = tLine(l1, l2, dur, tr);
	let pm = tLine(0, pme, dur, tr);
	eqPan2(pmOsc(cf, mf, pm, 0), l)
}.overlapTexture(2, 2, 4).mix * 0.05

/* pmOsc ; Event control */
let s = Voicer(1, 16) { :e |
	let cps = (e.x * 24 + 42).midiCps;
	let cpsv = cps + (cps * sinOsc(e.y * 4 + 4, 0) * 0.02);
	let mfreq = linLin(lfPulse(1 / 8, 0, 0.5), 0, 1, 1.01, 2.01) * cps;
	let ix = txLine(3, 0.001, 0.2, e.w);
	pmOsc(cpsv, mfreq, ix, 0) * e.z * e.w
}.sum;
xFade2(s, gVerb(bpf(s, 90.midiCps, 1), 50, 5, 0.5, 0.5, 15, 0, 0.7, 0.5, 300), 0.2, 1)
