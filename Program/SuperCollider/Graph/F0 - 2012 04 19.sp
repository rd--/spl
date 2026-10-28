/* 2012-04-19 (F0) ; http://www.listarc.bham.ac.uk/lists/sc-users/msg17536.html */
let sw = lfSaw(10, 0) * 0.01;
let t0 = lfTri([5, 6] * 0.1, 0);
let t1 = lfTri(0.1, 0) * 0.05 + 0.05;
combN(
	limiter(brf(sw, t0, 1), 1, 0.01),
	0.1,
	t1.round(0.01),
	1
) * 0.1
