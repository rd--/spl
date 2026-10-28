/* http://www.youtube.com/watch?v=a6JAF-jHBlw ; lnu ; requires=Fm7 */
let m = {
	lfTri(rand(0, 0.005), 0) * 0.0003 + 0.5
};
let v = lfTri(m(), 0) * 0.001 + 0.6;
let c = {
	tChoose(
		cuspN(120 * m().hypotenuse(v.tan) ^ v, 1, 1.9, 0),
		[0 5.1 -4.7 -12 7]
	)
};
let f = { :a |
	fm7Matrix(
		List(
			6,
			[
				(c() + a).midiCps,
				0,
				sinOsc(13 * v, 0) * 0.2 + ((2 * v).exp * v) / 8
			]
		) * v,
		List(6, List(6, m()))
	).softClip.sum
};
splay2(
	[0 3.1 7.05 10 -9 17].collect { :n |
		eqPan2(
			f(c() + 52 + n) * (12 * m().-).dbAmp,
			lfNoise2(500)
		)
	},
	0.5, 1, 0, true
).transpose.mix
