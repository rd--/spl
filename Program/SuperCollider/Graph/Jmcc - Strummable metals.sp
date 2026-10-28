/* Strummable metals ; use mouse to strum strings (Jmcc) */
let mousex = mouseX(0, 1, 0, 0.2);
let str = [1 .. 8].collect { :i |
	let trigger = hpz1(mousex > (0.25 + (i * 0.07))).abs;
	let pluck = pinkNoise() * decay(trigger, 0.05) * 0.04;
	let n = 15;
	eqPan2(
		ringzBank(
			pluck,
			{ 300 * i + linRand(0, 8000, 0) } ! n,
			nil,
			{ rand(1, 4) } ! n
		),
		i * 0.2 - 0.5
	)
};
leakDc(lpf(str.mix, 12000), 0.995)
