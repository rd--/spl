/* linCongC ; texture */
{ :tr |
	let freq = sampleRate() / 2;
	let m = tiRand(0, 1000000, tr);
	let a = tiRand(1, 2000, tr);
	let c = tiRand(1, 30000, tr);
	linCongC(freq, a, c, m, { tiRand(0, m, tr) } ! 2) * 0.1
}.overlapTexture(1, 2, 4).mix

/* linCongC ; rd edit ; https://github.com/lukiss/Losers-Union-SC-Research */
let p = 9 / 7 ^ [0 .. 16];
let c = { :freq |
	linCongC(freq, 1.1, 0.13, 1, 0)
};
let d = (c(c(p.arcTan) ^ 2 * 4) ^ 4 * 8).abs;
let tr = c(c(d / p.arcTan).round(1 / d) ^ 4 * d * 8).sin;
let f = tRand(0, 64, tr).ceiling.midiCps;
sinOsc(f, 0).splay * 0.1
