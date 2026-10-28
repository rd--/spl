/* pulse harmonic warbulence (Jmcc) #12 */
let z = { :tr |
	let f = tRand(24, 96, tr).midiCps;
	let r = txLine(tExpRand(0.1, 20, tr), tExpRand(0.1, 20, tr), 25.6, tr);
	let n = 12;
	let p = lfPulse(tExpRand(0.2, 1.2, tr), tRand(0.1, 0.2, tr), 0.5);
	[1 .. n].collect { :i |
		let m = sinOsc(r * tRand(0.9, 1.1, tr), tRand(0, 2.pi, tr)) * 0.1 - 0.05;
		eqPan2(sinOsc(f * i + f, 0) * m.max(0), tRand(-1, 1, tr)) / (i + 1)
	}.sum * p
}.overlapTexture(12.8, 6.4, 6).mix;
{
	combN(z, 0.3, { rand(0.1, 0.3) } ! 2, 8)
} !+ 5 * 0.25
