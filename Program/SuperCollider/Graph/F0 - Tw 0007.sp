/* http://sccode.org/1-4Qy ; tweet0007 ; texture variant (rd) ; requires=LinRand */
{ :tr |
	let p = pluck(
		crackle([1.9, 1.8]),
		impulse(tiRand(1, 6, tr), 0),
		0.05,
		tLinRand(0, 0.05, 0, tr),
		1,
		0.5
	);
	bpf(p, tiRand(0, 1200, tr), 1)
}.overlapTexture(1, 23, 8).mix
