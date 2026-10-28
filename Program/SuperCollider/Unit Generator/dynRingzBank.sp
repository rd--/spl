/* dynRingzBank */
let tr = dust(25);
let mkRand = { :lhs :rhs |
	lag(tRand(lhs, rhs, tr), 0.01)
};
let k = dynRingzBank(
	trig(tr, sampleDur()),
	[1 .. 5] * 2700,
	{ mkRand(0.025, 0.04) } ! 5,
	[0.1]
);
let n = k + (brownNoise() * 0.075 * trig(tr, mkRand(0.01, 0.03)));
let f = lpf(hpf(n, mkRand(6000, 750)), mkRand(4000, 5500));
eqPan(f, mkRand(-1, 1))
