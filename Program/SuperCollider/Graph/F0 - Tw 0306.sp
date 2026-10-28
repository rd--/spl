/* http://sccode.org/1-4Qy (F0) ; 0306 */
let o = [0 .. 1].collect { :i |
	sinOsc(
		duty(
			i + 1 / 9,
			0,
			dseq(Infinity, [1 .. 8].stutter(32)) * dseq(Infinity, [1 .. 8].fibonacci) * 99
		),
		0
	)
};
hpf(freeVerb(o, 0.2, 1, 0.2), 9) / 3
