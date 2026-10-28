/* http://sccode.org/1-4Qy (F0) ; tweet0003 ; texture variant ; requires=LinRand */
{ :tr |
	let t = sinOsc(
		tRand(1, 999, tr),
		0
	).abs;
	{
		formlet(
			tDuty(t, 0, t),
			tLinRand(20, 4000, 0, tr),
			t,
			1 - t
		)
	} ! 2
}.overlapTexture(15, 1, 8).mix
