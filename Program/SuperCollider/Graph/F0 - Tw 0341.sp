/* http://sccode.org/1-4Qy (F0) ; 0341 */
let e = lfTri(2 ^ lfTri(1 / 5, 0), 0).round(lfTri(1 / 8, 0) / 3);
let o = sinOsc(e ^ [99, 150], bpf(e % 1, 500, 1)) / 6;
gVerb(hpf(o, 9), 99, 5, 0.1, 0.5, 15, 1, 0.7, 0.5, 300).mix
