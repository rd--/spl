/* Jmcc ; choip choip choip */
let dur = 12;
let z = { :tr |
	let i = impulse(
		txLine(
			tExpRand(1, 30, tr),
			tExpRand(1, 30, tr),
			dur,
			tr
		),
		0
	);
	let f = txLine(
		tExpRand(600, 8000, tr),
		tExpRand(600, 8000, tr),
		dur,
		tr
	);
	let o = sinOsc(decay2(i, 0.05, 0.5) * -0.9 * f + f, 0);
	let l = txLine(
		tExpRand(0.01, 0.5, tr),
		tExpRand(0.01, 0.5, tr),
		dur,
		tr
	);
	let s = decay2(i * l, 0.01, 0.2) * o;
	eqPan2(s, tLine(tRand(-1, 1, tr), tRand(-1, 1, tr), dur, tr))
}.overlapTexture(dur - 2, 1, 8).mix;
4.timesRepeat {
	z := allpassN(z, 0.1, { rand(0, 0.05) } ! 2, 4)
};
z
