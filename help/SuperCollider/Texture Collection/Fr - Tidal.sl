{- tidal ; https://strudel.cc/#Ly8gIkZpYm9uYWNjaSBzb25pZmljYX... -}
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
let env = Linen(Impulse(0, 0), 0, 1, ctl::release, 2);
let osc = Saw([ctl::freq, ctl::freq * ctl::detune]) * env;
let saw = Rlpf(osc, XLine(ctl::cutoff, 100, ctl::release), 1 / ctl::q) * ctl::amp;
UgenGraph('saw', saw).send;
LsBind(
	instrument: 'saw',
	dur: 1 / 16,
	freq: LsSeq((60 + (seq - 1).degreeToKey([0 2 5 7 9], 12)).MidiCps, inf),
	amp: 0.1
).play

{- tidal ; graph variant -}
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
let tr = Impulse(LfNoise2(1 / 3).Range(9, 16), 0);
let freq = Sequencer(((seq - 1).degreeToKey([0 2 5 7 9], 12) + 60).MidiCps, tr);
let w = TrigRoundRobin(24, tr);
let env = Perc(w, 1 / 33, 3 / 5, TRand(-3, -1, w));
let osc = Saw([freq, freq * TRand(1, 1.01, w)]) * env;
Rlpf(osc, MouseX(333, 4444, 0, 0.2), MouseY(0.25, 4, 0, 0.2)).Sum / 3
