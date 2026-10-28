/* http://sccode.org/1-4Qy (F0) ; 0246 */
let b = [1 .. 9] * 1.5;
let d = [2 / b, 3 / b];
let e = lfPulse(d, 0, 0.5);
combC(
	ringz(e, (lfPulse(1 / b, 0, 0.5) * b + 50).midiCps, b / 9).sum * 0.0002,
	2,
	2 - lpf(e, 50),
	1
).transpose.mix
