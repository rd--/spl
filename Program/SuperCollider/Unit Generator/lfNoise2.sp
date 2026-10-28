/* lfNoise2 ; fixed frequency */
lfNoise2(1000) * 0.05

/* lfNoise2 ; modulate frequency */
lfNoise2(xLine(1000, 10000, 10)) * 0.05

/* lfNoise2 ; modulate frequency */
lfNoise2(xLine(1000, 10000, 10)) * 0.05

/* lfNoise2 ; modulate parameters */
let n = 23;
let s = [1 .. n].collect { :i |
	let lf = 3 * (1.1 ^ i);
	let o1 = lfNoise2(lf) * sinOsc(expRand(0.08, 0.16), rand(0, 1)).linLin(-1, 1, 0, 4);
	let o2 = sinOsc(
		expRand(0.08, 0.16),
		rand(0, 1)
	).linLin(-1, 1, 0.3, 2) * i;
	let o3 = sinOsc(
		(35 + (i / n * 3) + o1 + o2).midiCps,
		rand(0, 1)
	) ^ 7;
	let e = lfNoise2(expRand(0.05, 2)).linLin(-1, 1, 0, 0.1) * line(0, 1, i * 3 / 2);
	eqPan2(
		o3 ^ (i / 3),
		lfSaw(lfNoise2(lf) / i, rand(0, 1))
	) * e
}.sum;
freeVerb2(s.first, s.second, 1 / 3, 0.5, 0.5)
