/* http://twitter.com/n_peeq_t/status/1613573427717345282 ; packet size */
([1 .. 99] ^ 1.046).collect { :i |
	eqPan(
		sinOsc(99 * i, 0) * i / 99 / 9,
		sinOsc(i / 50, 0)
	) * perc(
		sinOsc(sinOsc(i / 9999, 3) * 7, 0.5) * 0.5,
		0,
		sinOsc(i / 9999, 0.1) * 0.1,
		-2
	)
}.sum
