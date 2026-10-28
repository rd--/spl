/* 20061023 ; rd */
let tr = impulse(
	slope(sinOsc(lfNoise0([0.5, 1.5]), 0)).abs * [2, 3],
	0
);
ringz(
	decay2(tr, 0.1, 0.2),
	tRand(mouseX(960, 3620, 1, 0.2), 3940, tr),
	tRand(0.005, 0.275, tr) * mouseY(0.5, 2.0, 0, 0.2)
)
