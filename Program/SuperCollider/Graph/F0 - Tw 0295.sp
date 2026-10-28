/* http://sccode.org/1-4Qy (F0) ; 0295 */
let a = sinOsc([600, 500, 99, 50, 8 / 3], 0);
let b = sinOsc(0.1 / [9, 8, 7, 6, 5], 0);
let c = (a * b).reduce(hypotenuse/2) / 2;
allpassC(
	hpf(c, 9),
	1,
	sinOsc(1 / [80, 90], 0) / 3 + 0.5,
	5
)
