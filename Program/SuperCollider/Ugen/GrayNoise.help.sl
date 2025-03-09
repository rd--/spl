/* GrayNoise */
{ :tr |
	Ringz(
		Lpz1(
			GrayNoise(
				LfPulse(
					4,
					0,
					0.1
				) * 0.002 # 2,
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
