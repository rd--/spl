/* http://sccode.org/1-4Qy (F0) ; 0290 */
let b = [99, 98];
let c = sinOsc(12, 0);
let o = sinOsc(b, c) + (sinOsc(c > 0 * 8 * b, 0) * sinOsc(1 / b, 0));
(allpassC(o, 1, sinOsc(1 / [3, 4], 0) % 1, 8) * sinOsc(1 / 64, [0, 1]) * 3).sin * 0.5
