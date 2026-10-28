/* hpf */
hpf(
	saw(200) * 0.1,
	sinOsc(
		xLine(0.7, 300, 20),
		0
	) * 3600 + 4000
)

/* hpf */
sinOsc(
	hpf(
		lfSaw(5, 0),
		sinOsc(
			xLine(0.07, 30, 20),
			0
		) * 35 + 40
	) * 200 + 500,
	0
) * 0.1

/* hpf */
sinOsc(
	hpf(
		lfSaw(5, 0.1),
		mouseX(2, 200, 1, 0.2)
	) * 200 + 400,
	0
) * 0.1

/* hpf */
eqPan2(
	hpf(
		pinkNoise(),
		[3000 11000]
	),
	sinOsc(
		[1 / 7, 1 / 13],
		[0, 1.pi]
	)
).mix * 0.1

/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft */
lpf(
	hpf(
		whiteNoise(
			[0.2] # 2,
			0
		),
		700
	),
	600
)
