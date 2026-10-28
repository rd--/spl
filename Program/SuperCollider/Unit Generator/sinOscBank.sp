/* sinOscBank */
sinOscBank([800, 1000, 1200], [0.3, 0.3, 0.3], [1.pi, 1.pi, 1.pi]) * 0.4

/* sinOscBank */
sinOscBank([800, 1000, 1200], 1, 0) * 0.3 * 0.4

/* sinOscBank */
{ sinOscBank({ 600.rand(1000) } ! 8, 0.1, 0) } ! 2 * 0.1

/* sinOscBank */
sinOscBank(
	{ (600 -- 1000).atRandom } ! [8, 2],
	0.1,
	0
) * 0.1

/* sinOscBank */
let f1 = [221 614 1145 1804 2577 3456 4419];
let f2 = [
	977 1003 1390 1414 1432 1465 1748 1834 1919 1933 1987 2096
	2107 2202 2238 2280 2400 2435 2507 2546 2608 2652 2691 2708
];
[f1, f2].collect { :f |
	let o = sinOscBank(
		f,
		{ rand(0.01, 0.1) } ! f.size / f * f.size.square,
		[0]
	);
	eqPan2(o, lfNoise2(0.25)) * lfNoise2(0.5).linLin(-1, 1, 0.05, 0.15)
}.mix
