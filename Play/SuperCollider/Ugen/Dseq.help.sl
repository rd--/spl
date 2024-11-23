/* Dseq ; shared Dseq, different patterns */
let a = Dseq(inf, [1, 3, 2, 7, 8]);
let t = Impulse(5, 0);
let f = Demand(t, 0, [a, a]) * 30 + 340;
SinOsc(f, 0) * 0.1

/* Dseq ; distinct dseq, equal patterns */
let a = Dseq(inf, [1, 3, 2, 7, 8]);
let b = Dseq(inf, [1, 3, 2, 7, 8]);
let t = Impulse(5, 0);
let f = Demand(t, 0, [a, b]) * 30 + 340;
SinOsc(f, 0) * 0.1

/* Dseq ; shared dseq, different patterns ; requires=keywords */
let a = Dseq(repeats: inf, list: [1, 3, 2, 7, 8]);
let t = Impulse(freq: 5, phase: 0);
let f = Demand(trig: t, reset: 0, demandUgens: [a, a]) * 30 + 340;
SinOsc(freq: f, phase: 0) * 0.1

/* Dseq ; distinct dseq, equal patterns ; requires=keywords */
let a = Dseq(repeats: inf, list: [1, 3, 2, 7, 8]);
let b = Dseq(repeats: inf, list: [1, 3, 2, 7, 8]);
let t = Impulse(freq: 5, phase: 0);
let f = Demand(trig: t, reset: 0, demandUgens: [a, b]) * 30 + 340;
SinOsc(freq: f, phase: 0) * 0.1

/* Dseq ; at audio rate ; mouse control */
let n = Dseq(inf, [1 3 2 7 8 32 16 18 12 24]);
let x = MouseX(1, 10000, 1, 0.1);
let t = Impulse(x, 0);
let f = Demand(t, 0, n) * 30 + 340;
SinOsc(f, 0) * 0.1

/* Dseq ; at control rate */
let n = Dseq(3, [1 3 2 7 8]);
let x = MouseX(1, 40, 1, 0.1);
let t = Impulse(x, 0);
let f = Demand(t, 0, n) * 30 + 340;
SinOsc(f.kr, 0) * 0.1

/* Dseq ; the Sc2 Sequencer UGen is somewhat like the Demand & Seq idiom below */
let tr = Impulse(6, 0);
let n0 = Demand(tr, 0, Dseq(inf, [60 62 63 58 48 55]));
let n1 = Demand(tr, 0, Dseq(inf, [63 60 48 62 55 58]));
LfSaw([n0 n1].MidiCps, 0) * 0.05

/* Dseq ; rather than Mce expansion at tr, it can be clearer to view tr as a functor */
let freq = [2 3 5].collect { :trFreq |
	let tr = Impulse(trFreq, 0);
	let sq = Dseq(inf, [60 63 67 69]);
	Demand(tr, 0, sq).MidiCps
};
SinOsc(freq, 0).Splay * 0.1

/* Dseq */
let t = Impulse(2, 0);
let m = Demand(t, 0, Dseq(inf, [55 60 63 62 60 67 63 58]));
SinOsc(m.MidiCps, 0) * 0.1
