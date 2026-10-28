/* Sturmian sequencer ii (jrhb) */
let rules = [[0, 1], [0]];
let rewrite = { :c :n |
	let r = c;
	n.timesRepeat {
		r := r.collect { :e |
			rules[e + 1]
		}.++
	};
	r
};
let n = 7;
[0 .. n - 1].collect { :i |
	let str = rewrite([0], i + 6);
	let dt = 2 ^ (n - i).negate * 20;
	let trig = tDuty(dt, 0, dseq(1, str));
	let freq = tExpRand(200, (n - i) / n * 10100, trig);
	let trigFlt = bpf(trig, lfNoise2(0.1) * 0.02 + 1 * freq, 0.2);
	ringz(
		trigFlt,
		freq * [1, 1.1, 1.2],
		expRand(2 ^ i.negate * 0.1, 0.5)
	).sum.distort
}.splay * 0.5
