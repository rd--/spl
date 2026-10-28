/* 20060909 ; rd */
let p = {
	resonz(
		pulse(
			lfNoise0(4) * [32, 64],
			lfNoise0(32) * mouseX(0.001, 0.02, 1, 0.1)
		).lpz2,
		lfNoise0(2) * 0.1 + mouseY(120, 400, 1, 0.1),
		(lfNoise0(6) * 0.4) + 0.8
	) * 0.5
};
let q = {
	combN(p(), 0.2, lfNoise0(128) * 0.1 + 0.1, 3)
};
let r = {
	{
		{
			sinOsc(
				rand(50, 59) * mouseX(0.75, 1.25, 1, 0.1),
				0
			) * rand(0.04, 0.06) * mouseY(0.25, 1, 1, 0.1)
		} !+ 16
	} ! 2
};
p() + q() + r()
