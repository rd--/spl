/* Quotient ; integer division */
SinOsc(
	(
		(
			SinOsc(0.25, 0) * 200 + 500
		).Quotient(17) * 3
	).MidiCps,
	0
) * 0.1

/* Quotient ; integer division */
SinOsc(
	(
		(
			SinOsc(0.25, 0) * 200 + 500
		) // 17 * 3
	).MidiCps,
	0
) * 0.1
