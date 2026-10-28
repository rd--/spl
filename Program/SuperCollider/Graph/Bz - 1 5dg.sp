/* https://sccode.org/1-5dg (bz) kd=kick drum, sd = snare drum, hh = hi-hat, tm = tom, cl = clave, wd = wood block */
let ctl = (
	clVel: 30,
	div: [2, 3, 4, 6, 8, 3],
	hhVel: 110,
	kdDcy: 4,
	kdFreq: 45,
	kdRes: 0.005,
	kdVel: 86,
	sdDcy: 4,
	sdVel: 74,
	speed: 1,
	swing: 0.5,
	tmFreq: 135,
	tmVel: 70,
	wdVel: 100
).localControls;
let rGen = { :k :l :r | { system.expRand(l, r) } ! k };
let master = (lfSaw(ctl::speed, 1.pi) * 0.5 + 0.5).linCurve(0, 1, 0, 1, ctl::swing);
let trig = (master % (1 / ctl::div)) * ctl::div;
let kdEnv = (((trig[1].negate + 1).linCurve(0, 1, 0, 1, ctl::kdDcy).cube * 2) + 1).lag(0.001);
let sdEnv = ((trig[2].negate + 1).linCurve(0, 1, 0, 1, ctl::sdDcy).cube).lag(0.001);
let kd = resonz(trig[1], ctl::kdFreq * kdEnv, ctl::kdRes) * ctl::kdVel;
let sd = (resonz(trig[2], 222, 0.02) * 4 + (whiteNoise() + dust2(123) * 0.01)) * sdEnv.tanh * ctl::sdVel;
let hh = rhpf(resonz(trig[3], 11.rGen(4000, 6500), 0.0005).sum, 2400, 0.4) * ctl::hhVel;
let tm = resonz(trig[4], ctl::tmFreq, 0.03) * ctl::tmVel;
let cl = hpf((resonz(trig[5], 9.rGen(500, 3500), 0.01) * ctl::clVel).sum, 700);
let wd = resonz(trig[6], 850, 0.04) * ctl::wdVel;
([kd] # 2 + sd + hh + tm + cl + wd).tanh * 0.15
