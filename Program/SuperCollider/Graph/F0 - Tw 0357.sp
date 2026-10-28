/* http://sccode.org/1-4Qy (F0) ; 0357 ; requires=BLowPass4 */
let c = 1 / [31, 23];
let b = varSaw(c, 0, 0.5);
let o = varSaw((varSaw([7, 6], 0, 0.5) < 0 + b) > 1 + 1 * 99, 0, 1 - b / 2) % b;
hpf(bLowPass4(o, 4 ^ varSaw(c, 0, 0.5) * 666, 0.08).sin / 2, 9)
