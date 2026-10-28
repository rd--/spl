/* http://twitter.com/HernaniVillase/status/517517924236795905 ; rewrite (rd) */
{ :tr |
	let f = tRand(97, 101, tr);
	let o = lfTri(
		{ tRand(0, 200, tr) + 216 } ! 8 + f,
		{ tRand(0, 2.pi, tr) } ! 8
	);
	let e = lfTri(
		{ tRand(0, 0.01, tr) + 0.1 } ! 8,
		0
	) * 0.1 + 0.01;
	(o * e).splay2
}.overlapTexture(3, 5, 3).mix
