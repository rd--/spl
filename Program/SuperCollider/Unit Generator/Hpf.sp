/* Hpf */
Hpf(
	Saw(200) * 0.1,
	SinOsc(
		XLine(0.7, 300, 20),
		0
	) * 3600 + 4000
)

/* Hpf */
SinOsc(
	Hpf(
		LfSaw(5, 0),
		SinOsc(
			XLine(0.07, 30, 20),
			0
		) * 35 + 40
	) * 200 + 500,
	0
) * 0.1

/* Hpf */
SinOsc(
	Hpf(
		LfSaw(5, 0.1),
		MouseX(2, 200, 1, 0.2)
	) * 200 + 400,
	0
) * 0.1

/* Hpf */
EqPan2(
	Hpf(
		PinkNoise(),
		[3000 11000]
	),
	SinOsc(
		[1 / 7, 1 / 13],
		[0, 1.pi]
	)
).Mix * 0.1

/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft */
Lpf(
	Hpf(
		WhiteNoise(
			2 # [0.2],
			0
		),
		700
	),
	600
)
