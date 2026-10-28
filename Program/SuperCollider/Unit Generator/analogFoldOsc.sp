/* analogFoldOsc */
lpf(
	analogFoldOsc(
		60 + [0, 1],
		linLin(
			sinOsc(lfSaw(0.1, 0) * 4, 0),
			-1, 1, 0, 1
		)
	),
	1330
)
