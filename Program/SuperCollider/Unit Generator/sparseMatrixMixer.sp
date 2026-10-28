/* sparseMatrixMixer ; identity ; copy 2-channel input to 2-channel output */
sparseMatrixMixer(2, sinOsc([220, 221], 0) * 0.1, [1 1 1; 2 2 1])

/* sparseMatrixMixer ; copy 2-channel input to channels 9 & 13 of 24-channel output */
sparseMatrixMixer(24, sinOsc([220, 221], 0) * 0.1, [1 9 1; 2 13 1])

/* sparseMatrixMixer ; randomly copy from 4-channel input to 24-channel output */
{ :tr |
	sparseMatrixMixer(
		24,
		{
			sinOsc(tRand(220, 550, tr), 0)
		} ! 4,
		{
			[
				[1 .. 4].atRandom,
				[1 .. 24].atRandom,
				0.01 + 0.05.atRandom
			]
		} ! 6
	)
}.overlapTexture(6, 5, 4).sum

/* sparseMatrixMixer ; displace 4-channel input by two places at 6-channel output */
sparseMatrixMixer(6, sinOsc([32 .. 35], 0) * 0.25, [1 3 1; 2 4 1; 3 5 1; 4 6 1])
