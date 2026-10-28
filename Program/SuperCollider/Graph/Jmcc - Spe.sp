/* Spe (Jmcc) */
let t = impulse(9, 0);
let s = [0, 3, 2, 7, 8, 32, 16, 18, 0, 12, 24, 32];
let f = (demand(t, 0, dseq(Infinity, s)) + 32).midiCps;
let e = decay2(t, 0.05, 1) * 0.1;
let z = rlpf(lfSaw(f, 0) * e, (lfNoise1(1) * 36 + 110).midiCps, 0.1);
4.timesRepeat {
	z := allpassN(z, 0.05, { rand(0, 0.05) } ! 2, 4)
};
z * 0.25
