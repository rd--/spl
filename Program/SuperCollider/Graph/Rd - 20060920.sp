/* 20060920 ; rd */
formlet(
	blip(10, 12),
	lfNoise0([20 40]) * 43 + 700,
	0.005,
	mouseX(0.012, 0.19, 1, 0.1)
) * lfNoise2([5 10]) * line(0, 0.5, 2.5)
