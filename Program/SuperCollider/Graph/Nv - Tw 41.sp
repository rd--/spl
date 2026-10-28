/* http://swiki.hfbk-hamburg.de/MusicTechnology/899 (Nv) [Line 41] */
[1 .. 15].collect { :i |
	let f = 1.9 ^ i / 128;
	let p = pinkNoise([1] # 2, 0);
	let b = 4 ^ lfNoise2(1.2 ^ i / 16);
	bpf(p, b * 300, 0.15) * (5 ^ lfNoise2(f) / (i + 8) * 20)
}.splay2.transpose.mix
