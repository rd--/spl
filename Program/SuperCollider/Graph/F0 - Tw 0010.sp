/* http://sccode.org/1-4Qy (F0) ; 0010 */
leakDc(
	sinOsc(
		sinOsc(0.31, 0),
		sinOsc(
			sinOsc(0.21, 0),
			sinOsc(
				sinOsc(0.11, sinOsc(0.01, 0)),
				0
			) * sinOsc([2, 3], 0) * 400
		)
	) * sinOsc([0.3, 0.21], 0),
	0.995
)
