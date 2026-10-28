/* Chainsaw (jrhb) */
let f = { :saw |
	let rate = [ExpRand(0.1, 2)] # 2;
	let freq1 = system.coin(0.6).if {
		LfNoise1(rate).expRange(0.01, 10)
	} {
		LfNoise1(rate).expRange(10, 50)
	};
	let freq2 = saw.expRange(freq1, freq1 * LfNoise1(rate).expRange(2, 10));
	let u1 = LfSaw(freq2, 0);
	let u2 = system.coin(0.5).if {
		u1 * [1 - saw, saw.reverse].atRandom
	} {
		u1 * (LfSaw(freq1 * 0.1, 0) * 0.1 + 1)
	};
	u2.bilateralClip(1.0)
};
let g = { :aBlock :count |
	let r = aBlock;
	count.timesRepeat {
		r := r.compose(r)
	};
	r
};
let h/1 = g(f/1, 4);
let freq3 = h(LfSaw(0.2 * [1, 1.1], 0)).expRange(6, 11000);
let osc = Bpf(Saw(freq3).product, [70, 800, 9000, 5242], 0.2).sum;
[osc, osc] * 0.3
