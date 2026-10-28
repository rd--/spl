/* Tw 0120 (F0) */
let z = lfTri(1 / [7, 8], 0) * lfTri(1 / 9, 0) * 99;
let l = [60 .. 79].midiCps.localBuf;
let f = bufRd(1, l, z, 0, 1);
let w = lfTri(1 / [3, 4], 0) % 1;
let o = varSaw(f, 0, w);
combN(o, 1, 1 / [5, 6], 8) / 8
