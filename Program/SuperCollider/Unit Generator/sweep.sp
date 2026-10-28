/* sweep ; modulate sine frequency */
sinOsc(
	sweep(
		impulse(
			mouseX(0.5, 20, 1, 0.2),
			0
		),
		700
	) + 500,
	0
) * 0.1

/* sweep ; modulate sine frequency ; filter methods */
mouseX(0.5, 20, 1, 0.2)
.impulse(0)
.sweep(700)
.+(500)
.sinOsc(0)
.*(0.1)
