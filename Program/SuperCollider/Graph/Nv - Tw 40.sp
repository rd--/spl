/* http://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) [Line 40] */
let x = [0 .. 8].collect { :i |
	let t = 0.6 ^ i * 40 * impulse(2 ^ i / 32, 1 / 2);
	let f = 4 ^ lfNoise0(1 / 16) * 300;
	rlpf(t, f, 0.005).sin
}.splay2;
2.timesRepeat {
	x := freeVerb2(x.first, x.second, 0.1, 1, 1)
};
x
