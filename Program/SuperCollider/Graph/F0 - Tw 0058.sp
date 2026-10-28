/* http://sccode.org/1-4Qy (F0) ; 0058 ; requires=Demand.ListExpansion */
let p = saw([3 4]) * (saw(1) * 32 + 128) + duty(1, 0, (dseq(1, [0 8 1 5]) * [1 4 8]).flop);
let o = sinOsc(saw(3) * 64 + 99, p) / 9;
combN(o, 1, 1 / 6, 1).transpose.mix
