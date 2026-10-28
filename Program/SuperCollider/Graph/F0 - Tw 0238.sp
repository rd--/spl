/* http://sccode.org/1-4Qy (F0) ; 0238 */
let b = [7 6 5 4];
let c = lfCub(b / 99, 0) % 1 / 50;
let o = formlet(
	logistic(3.9, b, 0.5),
	lfCub(b, 0) + lfCub(b / 7, 0) * 800 + 999,
	c,
	c * 2
) / 9;
limiter(o, 1, 0.01).splay
