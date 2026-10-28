/* http://sccode.org/1-4Qy (F0) ; 0250 */
let f = latch(lfSaw(1.50055, List(2, [0 0.0005])), lfSaw([15 4 2], 0)) * [999 400 150];
let o = lfSaw(f, 0).mix;
allpassC(o / 4, 3, 2 - lfSaw(0.1, [0 1]), 1)
