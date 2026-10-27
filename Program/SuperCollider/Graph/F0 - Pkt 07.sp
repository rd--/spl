/* Pkt 07 (F0) ; http://fredrikolofsson.com/f0blog/pact-februari/ */
GVerb(
	LeakDc(
		SinOsc(
			SinOsc(
				SinOsc(
					SinOsc(
						SinOsc(
							SinOsc(
								SinOsc(1, 0).*+(
									2,
									linExp(SinOsc(1 / 2, 0), -1, 1, 1, 2)
								),
								0
							).*+(
								8,
								linExp(SinOsc(1 / 4, 0), -1, 1, 4, 8)
							),
							0
						).*+(
							32,
							linExp(SinOsc(1 / 8, 0), -1, 1, 16, 32)
						),
						0
					).*+(
						128,
						linExp(SinOsc(1 / 16, 0), -1, 1, 64, 128)
					),
					0
				).*+(
					512,
					linExp(SinOsc(1 / 32, 0), -1, 1, 256, 512)
				),
				0
			).*+(
				2048,
				linExp(SinOsc(1 / 64, 0), -1, 1, 1024, 2048)
			),
			0
		) * 0.1,
		0.995
	),
	16, 8, 0.75, 0.5, 15, 1, 0.7, 0.5, 300
) * 0.25
