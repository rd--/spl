/* Clipped inharmonic warbulence (Jmcc) */
let z = { :tr |
	let r = linExp(LfNoise1(1 / 16), -1, 1, 0.1, 20);
	let f = TRand(24, 96, tr).midiCps;
	let a = (500 / f).min(1);
	let n = 12;
	a * [1 .. n].collect { :i |
		let g = TRand(0, n, tr) + 1;
		let o1 = SinOsc(f * g, 0);
		let o2 = SinOsc(
			r * TRand(0.9, 1.1, tr),
			TRand(0, 2.pi, tr)
		) * 0.08 - 0.04;
		let o = (o1 * o2.max(0)).max(0);
		EqPan2(o, TRand(-1, 1, tr)) * 2 / g
	}.Sum
}.OverlapTexture(12.8, 6.4, 6).Mix;
{
	CombN(LeakDc(z, 0.995), 0.3, { Rand(0.1, 0.3) } ! 2, 20)
} !+ 8 * 0.2
