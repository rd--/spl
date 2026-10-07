/* GreyNoise */
{ :tr |
	Ringz(
		Lpz1(
			GreyNoise(
				LfPulse(
					4,
					0,
					0.1
				) * (2 # [0.002]),
				0
			)
		),
		{
			TRand(
				80,
				400,
				tr
			)
		} ! 4,
		1
	)
}.OverlapTexture(4, 4, 3).Mix
