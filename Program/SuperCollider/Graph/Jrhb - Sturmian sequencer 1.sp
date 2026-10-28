/* Sturmian sequencer i (jrhb) ; ? */
let rules = [[0, 1], [0]];
let rewrite = { :n |
	let r = [0];
	n.timesRepeat {
		r := r.collect { :e |
			rules[e + 1]
		}.++
	};
	r
};
[0 .. 6].collect { :i |
	let str = rewrite(i + 6);
	let dt = 2 ^ i.negate * 10;
	let trig = sequencer(str, impulse(1 / dt, 0));
	let freq = expRand(200, i + 1 / 7 * 10100);
	ringz(
		trig,
		freq * [1, 1.2, 1.5],
		expRand(2 ^ i.negate * 0.1, 1.101)
	).sum.distort
}.splay * 0.5
