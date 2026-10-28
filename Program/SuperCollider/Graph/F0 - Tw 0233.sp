/* http://sccode.org/1-4Qy (F0) ; 0233 */
let b = 1 / [1 4 6 8 11];
let c = lfTri(b / 98, 0);
let s = bufRd(1, (1 / b + 59).localBuf, lfTri(b / 99, 0) + c * 5, 0, 1);
let q = dseq(Infinity, s).midiCps;
splay(lfTri(duty(b, c, q) + c, 0) / 2)
