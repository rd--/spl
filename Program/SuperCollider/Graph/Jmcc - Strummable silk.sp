/* Strummable silk (Jmcc) #11 */
let x = mouseX(0, 1, 0, 0.2);
let str = [1 .. 8].collect { :ix |
	let n = 15;
	let tr = hpz1(x > (0.25 + (ix - 1 * 0.07))).abs;
	let env = decay(impulse(14, 0) * lag(trig(tr, 1), 0.2) * 0.01, 0.04);
	let pluck = pinkNoise() * env;
	let degree = [-2 0 3 5 7 10 12 15];
	let freq = (degree[ix] + 60).midiCps;
	let metal = ringzBank(
		pluck,
		[1 .. n] * freq,
		[1],
		{ rand(0.3, 1) } ! n
	);
	eqPan(metal, ix - 1 * 0.2 - 0.5)
};
let s = leakDc(lpf(str.sum, 12000), 0.995);
6.timesRepeat {
	s := allpassN(s, 0.1, { rand(0, 0.05) } ! 2, 4)
};
s
