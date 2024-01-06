(* https://sccode.org/1-4Qy ; f0 ; 0232 ; requires=pyramid *)
let b = [4, 3];
let q = 9.fibonacciArray.pyramid(1) * 99;
let o = SinOsc(Duty(1 / b, 0, Dseq(inf, q)), 0);
let e = SinOsc(b / 9, 0);
let d = SinOsc(b / 999, 0).Abs + 0.01;
CombC(o * e, 1.01, d, 9).Tanh / 2

(* ---- ; calculations

9.fibonacciArray.pyramid(1) = [
	1,
	1, 1,
	1, 1, 2,
	1, 1, 2, 3,
	1, 1, 2, 3, 5,
	1, 1, 2, 3, 5, 8,
	1, 1, 2, 3, 5, 8, 13,
	1, 1, 2, 3, 5, 8, 13, 21,
	1, 1, 2, 3, 5, 8, 13, 21, 34
]

*)
