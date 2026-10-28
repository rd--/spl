/* greyNoise */
{ :tr |
	ringz(
		lpz1(
			greyNoise(
				lfPulse(
					4,
					0,
					0.1
				) * ([0.002] # 2),
				0
			)
		),
		{
			tRand(
				80,
				400,
				tr
			)
		} ! 4,
		1
	)
}.overlapTexture(4, 4, 3).mix
