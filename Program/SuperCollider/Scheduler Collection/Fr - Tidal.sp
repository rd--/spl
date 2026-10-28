/* tidal ; https://strudel.cc/#Ly8gIkZpYm9uYWNjaSBzb25pZmljYX... */
let seq = [
	1
	2
	3 1
	4 1 2
	5 1 2 3 1
	6 1 2 3 1 4 1 2
	7 1 2 3 1 4 1 2 5 1 2 3 1
	8 1 2 3 1 4 1 2 5 1 2 3 1 6 1 2 3 1 4 1 2
	9 1 2 3 1 4 1 2 5 1 2 3 1 6 1 2 3 1 4 1 2 7 1 2 3 1 4 1 2 5 1 2 3 1
	10 1 2 3 1 4 1 2 5 1 2 3 1 6 1 2 3 1 4 1 2 7 1 2 3 1 4 1 2 5 1 2 3 1 8 1 2 3 1 4 1 2 5 1 2 3 1 6 1 2 3 1 4 1 2
];
let ctl = (
	freq: 440,
	amp: 0.1,
	release: 1,
	detune: 1.01,
	cutoff: 5000,
	q: 0.5
).localControls;
let env = linen(impulse(0, 0), 0, 1, ctl::release, 2);
let osc = saw([ctl::freq, ctl::freq * ctl::detune]) * env;
let saw = rlpf(osc, xLine(ctl::cutoff, 100, ctl::release), 1 / ctl::q) * ctl::amp;
UgenGraph('saw', saw).send;
LsBind(
	instrument: 'saw',
	dur: 1 / 16,
	freq: LsSeq(
		(60 + [0 2 5 7 9].degreeToKey(seq - 1, 12)).midiCps,
		Infinity
	),
	amp: 0.1
)

/* tidal ; graph variant */
let seq = [
	1
	2
	3 1
	4 1 2
	5 1 2 3 1
	6 1 2 3 1 4 1 2
	7 1 2 3 1 4 1 2 5 1 2 3 1
	8 1 2 3 1 4 1 2 5 1 2 3 1 6 1 2 3 1 4 1 2
	9 1 2 3 1 4 1 2 5 1 2 3 1 6 1 2 3 1 4 1 2 7 1 2 3 1 4 1 2 5 1 2 3 1
	10 1 2 3 1 4 1 2 5 1 2 3 1 6 1 2 3 1 4 1 2 7 1 2 3 1 4 1 2 5 1 2 3 1 8 1 2 3 1 4 1 2 5 1 2 3 1 6 1 2 3 1 4 1 2
];
let tr = impulse(lfNoise2(1 / 3).linLin(-1, 1, 9, 16), 0);
let freq = sequencer(
	([0 2 5 7 9].degreeToKey(seq - 1, 12) + 60).midiCps,
	tr
);
let w = trigRoundRobin(24, tr);
let env = perc(w, 1 / 33, 3 / 5, tRand(-3, -1, w));
let osc = saw([freq, freq * tRand(1, 1.01, w)]) * env;
rlpf(osc, mouseX(333, 4444, 0, 0.2), mouseY(0.25, 4, 0, 0.2)).sum / 3
