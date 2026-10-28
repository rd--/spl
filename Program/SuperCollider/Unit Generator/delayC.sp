/* delayC ; decorrelation */
let x = brownNoise() * 0.2;
[
	delayC(x, 0.01, 0.01),
	delayC(x, 0.02, mouseX(0.02, 0, 0, 0.2))
]

/* delayC ; inter-speaker delays */
let x = lfTri(1000, 0) * decay2(impulse(4, 0) * 0.2, 0.004, 0.2);
[
	delayC(x, 0.01, 0.01),
	delayC(x, 0.02, mouseX(0.02, 0, 0, 0.2))
]
