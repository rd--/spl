/* Sturmian sequencer iii (jrhb) */
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
let n = 9;
let x = mouseX(1, sampleRate(), 1, 0.2);
[1 .. n].collect { :i |
	let str = rewrite([0], i + 5);
	let dt = 1 / sampleRate() / (n - i + 1) * x;
	tDuty(dt, 0, dseq(Infinity, str - 0.5))
}.splay * 0.3
