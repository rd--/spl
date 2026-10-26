/* http://sccode.org/1-4Qy (F0) ; 0295 */
let a = SinOsc([600, 500, 99, 50, 8 / 3], 0);
let b = SinOsc(0.1 / [9, 8, 7, 6, 5], 0);
let c = (a * b).reduce(hypotenuse/2) / 2;
AllpassC(
	Hpf(c, 9),
	1,
	SinOsc(1 / [80, 90], 0) / 3 + 0.5,
	5
)
