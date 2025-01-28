/* SinOscBank */
SinOscBank([800, 1000, 1200], [0.3, 0.3, 0.3], [1.pi, 1.pi, 1.pi]) * 0.4

/* SinOscBank */
SinOscBank([800, 1000, 1200], 1, 0) * 0.3 * 0.4

/* SinOscBank */
{ SinOscBank({ 600.Rand(1000) } ! 8, 0.1, 0) } ! 2 * 0.1

/* SinOscBank */
SinOscBank((600 -- 1000).atRandom([8, 2]), 0.1, 0) * 0.1

/* SinOscBank */
let f1 = [221 614 1145 1804 2577 3456 4419];
let f2 = [
	977 1003 1390 1414 1432 1465 1748 1834 1919 1933 1987 2096
	2107 2202 2238 2280 2400 2435 2507 2546 2608 2652 2691 2708
];
[f1, f2].collect { :f |
	let o = SinOscBank(
		f,
		{ Rand(0.01, 0.1) } ! f.size / f * f.size.squared,
		[0]
	);
	EqPan2(o, LfNoise2(0.25)) * LfNoise2(0.5).LinLin(-1, 1, 0.05, 0.15)
}.Mix
