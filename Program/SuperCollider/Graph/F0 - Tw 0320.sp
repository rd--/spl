/* http://sccode.org/1-4Qy (F0) ; 0320 */
let b = [2 4 9 3] * 9;
let o = varSaw(
	varSaw(1 / b, 0, 0.5) > 0 + 3 * b,
	0,
	lag(varSaw(b / 2000, 0, 0.5) + 1 / 2, 1)
);
combC(o, 1.1, (varSaw(8 / b, 0, 0.5) % 1).round(1) + 0.1, 8).splay / 3
