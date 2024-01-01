(* https://twitter.com/SC2Sbot/status/1529852033251033088 (cg) *)
Splay2(
	Integrator(
		LfNoise0({ 7 } ! 4).RoundTo(SinOsc(4, 0)),
		1
	),
	Saw(
		DurationSequencer(
			[1, Drand(1, [5, 10]), 1, Drand(1, [11, 20])],
			4
		)
	),
	1,
	0,
	true
).Sin * 0.04
