/* Tank (Jmcc) */
let r = { :i |
	let l1 = onePole(localIn(2, 0) * 0.98, 0.33);
	let l2 = rotate2(l1.first, l1.second, 0.23);
	let l3 = allpassN(l2, 0.05, { rand(0.01,0.05) } ! 2, 2);
	let l4 = delayN(l3, 0.3, [0.17, 0.23]);
	let l5 = allpassN(l4, 0.05, { rand(0.03,0.15) } ! 2, 2);
	let l6 = leakDc(l5, 0.995) + i;
	l6 <! localOut(l6)
};
let z = {
	eqPan2(
		decay2(dust(0.2), 0.1, 0.5) * 0.1 * sinOsc(expRand(300, 2200), 0).cube,
		rand(-1, 1)
	)
} !+ 12 + eqPan2(
	decay2(dust(0.01), 0.04, 0.3) * brownNoise(),
	0
);
4.timesRepeat {
	z := allpassN(z, 0.03, { rand(0.005, 0.02) } ! 2, 1)
};
r(z)
