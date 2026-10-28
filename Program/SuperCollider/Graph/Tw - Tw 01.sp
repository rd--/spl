/* http://swiki.hfbk-hamburg.de/MusicTechnology/899 ; Tw ; Tim Walters */
[0 .. 15].collect { :k |
	[1 .. 6].collect { :i |
		sinOsc(
			i,
			sinOsc((i + k) ^ i, 0)
			/
			(
				decay(
					impulse((0.5 ^ i) / k, 0),
					[i, i + 1]
				) * k
			)
		)
	}.sum
}.sum.gVerb(1, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300).transpose.mix / 512
