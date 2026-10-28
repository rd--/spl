/* rlpf */
rlpf(dust([12, 15]), lfNoise1(1 / [3, 4]) * 1500 + 1600, 0.02)

/* rlpf */
let f = sinOsc(0.5, 0) * 40 + 220;
rlpf(whiteNoise(), f, 0.1)

/* rlpf */
let f = sinOsc(xLine(0.7, 300, 20), 0) * 3600 + 4000;
rlpf(lfSaw(200, 0) * 0.1, f, 0.2)

/* rlpf */
let ctl = rlpf(lfSaw(5, 0) * 0.1, 25, 0.03);
sinOsc(ctl * 200 + 400, 0) * 0.1

/* rlpf */
let freq = demand(
	impulse(0.25, 0),
	0,
	dseq(Infinity, [27, 24, 22, 24] + 2)
).midiCps + [0, 0.3];
rlpf(lfPulse(freq, 0, 0.2) * 0.4 - 0.2, 300, 0.5)

/* rlpf */
rlpf(
	dust(lfNoise1([0.2, 1.5]).linLin(-1, 1, [200, 2000], [300, 2700])),
	lfNoise1([1.5, 0.2]).linLin(-1, 1, 40, 300),
	0.02
)
