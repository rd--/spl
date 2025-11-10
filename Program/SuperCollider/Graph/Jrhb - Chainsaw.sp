/* Chainsaw (jrhb) */
let f = { :saw |
	let rate = 2 # [ExpRand(0.1, 2)];
	let freq1 = system.coin(0.6).if {
		LfNoise1(rate).ExpRange(0.01, 10)
	} {
		LfNoise1(rate).ExpRange(10, 50)
	};
	let freq2 = saw.ExpRange(freq1, freq1 * LfNoise1(rate).ExpRange(2, 10));
	let u1 = LfSaw(freq2, 0);
	let u2 = system.coin(0.5).if {
		u1 * [1 - saw, saw.reverse].atRandom
	} {
		u1 * (LfSaw(freq1 * 0.1, 0) * 0.1 + 1)
	};
	u2.Clip2(1.0)
};
let g = { :aBlock :count |
	let r = aBlock;
	count.timesRepeat {
		r := r.compose(r)
	};
	r
};
let freq3 = g(f:/1, 4).value(LfSaw(0.2 * [1, 1.1], 0)).ExpRange(6, 11000);
let osc = Bpf(Saw(freq3).product, [70, 800, 9000, 5242], 0.2).Sum;
[osc, osc] * 0.3
