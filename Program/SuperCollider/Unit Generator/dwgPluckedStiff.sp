/* DwgPluckedStiff ; re-sounding */
let tr = tDuty(dseq(Infinity, [1 1 2 1 1 1 2 3 1 1 1 1 2 3 4] * 0.175), 0, 1);
let freq = [
	sequencer([60 62 63 58 48 55], tr),
	sequencer([63 60 48 62 55 58], tr)
].midiCps;
let amp = tRand(0.05, 0.65, tr); /* pulse amplitude (0 - 1, def = 0.5) */
let gate = 1; /* synth release */
let pos = tRand(0.05, 0.25, tr); /* pluck position (0 - 1, def = 0.14) */
let c1 = 1 / tRand(0.25, 1.75, tr); /* reciprocal of decay time (def = 1.0) */
let c3 = tRand(10, 1400, tr); /* high frequency loss factor (def = 30) */
let inp = amp * lfClipNoise(2000) * decay2(tr, 0.001, tRand(0.05, 0.150, tr)) * lfClipNoise(2000); /* pluck signal */
let release = tRand(0.05, 0.15, tr); /* release time (seconds, def = 0.1) */
let fB = tRand(1, 4, tr); /* inharmonicity factor (def = 2.0) */
let ps = dwgPluckedStiff(freq, amp, gate, pos, c1, c3, inp, release, fB);
pan2(ps, tRand(-1, 1, tr), 0.1).mix
