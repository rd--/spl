/* dseq ; shared dseq, different patterns */
let a = dseq(Infinity, [1, 3, 2, 7, 8]);
let t = impulse(5, 0);
let f = demand(t, 0, [a, a]) * 30 + 340;
sinOsc(f, 0) * 0.1

/* dseq ; distinct dseq, equal patterns */
let a = dseq(Infinity, [1, 3, 2, 7, 8]);
let b = dseq(Infinity, [1, 3, 2, 7, 8]);
let t = impulse(5, 0);
let f = demand(t, 0, [a, b]) * 30 + 340;
sinOsc(f, 0) * 0.1

/* dseq ; shared dseq, different patterns ; requires=keywords */
let a = dseq(repeats: Infinity, list: [1, 3, 2, 7, 8]);
let t = impulse(freq: 5, phase: 0);
let f = demand(trig: t, reset: 0, demandUgens: [a, a]) * 30 + 340;
sinOsc(freq: f, phase: 0) * 0.1

/* dseq ; distinct dseq, equal patterns ; requires=keywords */
let a = dseq(repeats: Infinity, list: [1, 3, 2, 7, 8]);
let b = dseq(repeats: Infinity, list: [1, 3, 2, 7, 8]);
let t = impulse(freq: 5, phase: 0);
let f = demand(trig: t, reset: 0, demandUgens: [a, b]) * 30 + 340;
sinOsc(freq: f, phase: 0) * 0.1

/* dseq ; at audio rate ; mouse control */
let n = dseq(Infinity, [1 3 2 7 8 32 16 18 12 24]);
let x = mouseX(1, 10000, 1, 0.1);
let t = impulse(x, 0);
let f = demand(t, 0, n) * 30 + 340;
sinOsc(f, 0) * 0.1

/* dseq ; at control rate */
let n = dseq(3, [1 3 2 7 8]);
let x = mouseX(1, 40, 1, 0.1);
let t = impulse(x, 0);
let f = demand(t, 0, n) * 30 + 340;
sinOsc(f.kr, 0) * 0.1

/* dseq ; the Sc2 sequencer UGen is somewhat like the demand & Seq idiom below */
let tr = impulse(6, 0);
let n0 = demand(tr, 0, dseq(Infinity, [60 62 63 58 48 55]));
let n1 = demand(tr, 0, dseq(Infinity, [63 60 48 62 55 58]));
lfSaw([n0 n1].midiCps, 0) * 0.05

/* dseq ; rather than Mce expansion at tr, it can be clearer to view tr as a functor */
let freq = [2 3 5].collect { :trFreq |
	let tr = impulse(trFreq, 0);
	let sq = dseq(Infinity, [60 63 67 69]);
	demand(tr, 0, sq).midiCps
};
sinOsc(freq, 0).splay * 0.1

/* dseq */
let t = impulse(2, 0);
let m = demand(t, 0, dseq(Infinity, [55 60 63 62 60 67 63 58]));
sinOsc(m.midiCps, 0) * 0.1
