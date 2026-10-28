/* demand */
let n = dseq(Infinity, [0 2 4 5 7 9 11 12]) + (tRand(3, 6, dust(9)).round(0) * 12);
let t = impulse(10, 0);
let f = demand(t, 0, n.midiCps);
let o = sinOsc([f, f + 0.7], 0);
o.cube.cube * 0.1

/* demand */
let n = diwhite(Infinity, 60, 72);
let t = impulse(10, 0);
let f = demand(t, 0, n.midiCps);
let o = sinOsc([f, f + 0.7], 0);
o.cube.cube * 0.1
