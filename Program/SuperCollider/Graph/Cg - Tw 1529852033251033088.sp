/* http://twitter.com/SC2Sbot/status/1529852033251033088 (cg) */
splay2(
	integrator(
		lfNoise0({ 7 } ! 4).round(sinOsc(4, 0)),
		1
	),
	saw(
		sequencer(
			[1, drand(1, [5, 10]), 1, drand(1, [11, 20])],
			impulse(1 / 4, 0)
		)
	),
	1,
	0,
	true
).sin * 0.04
