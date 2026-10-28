/* Clipped inharmonic warbulence (Jmcc) */
let z = { :tr |
	let r = linExp(lfNoise1(1 / 16), -1, 1, 0.1, 20);
	let f = tRand(24, 96, tr).midiCps;
	let a = (500 / f).min(1);
	let n = 12;
	a * [1 .. n].collect { :i |
		let g = tRand(0, n, tr) + 1;
		let o1 = sinOsc(f * g, 0);
		let o2 = sinOsc(
			r * tRand(0.9, 1.1, tr),
			tRand(0, 2.pi, tr)
		) * 0.08 - 0.04;
		let o = (o1 * o2.max(0)).max(0);
		eqPan2(o, tRand(-1, 1, tr)) * 2 / g
	}.sum
}.overlapTexture(12.8, 6.4, 6).mix;
{
	combN(leakDc(z, 0.995), 0.3, { rand(0.1, 0.3) } ! 2, 20)
} !+ 8 * 0.2
