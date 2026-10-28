/* Tw 0049 (F0) */
let o0 = lfSaw(3, 0) * 9 + 99;
let s0 = sweep(0, [3 .. 9]) % o0;
let s1 = (sweep(0, [31 .. 1; -1] * -1 + 34) % 128).bitAnd(s0);
let o1 = sinOsc((s1 + 33).midiCps, 0).pi;
sinOsc(9, o1).splay / 9
