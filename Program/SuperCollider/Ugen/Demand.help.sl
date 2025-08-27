/* Demand */
let n = Dseq(Infinity, [0 2 4 5 7 9 11 12]) + (TRand(3, 6, Dust(9)).RoundTo(0) * 12);
let t = Impulse(10, 0);
let f = Demand(t, 0, n.MidiCps);
let o = SinOsc([f, f + 0.7], 0);
o.Cube.Cube * 0.1

/* Demand */
let n = Diwhite(Infinity, 60, 72);
let t = Impulse(10, 0);
let f = Demand(t, 0, n.MidiCps);
let o = SinOsc([f, f + 0.7], 0);
o.Cube.Cube * 0.1
