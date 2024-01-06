(* LinCongC ; texture *)
{ :tr |
	let freq = SampleRate() / 2;
	let m = TiRand(0, 1000000, tr);
	let a = TiRand(1, 2000, tr);
	let c = TiRand(1, 30000, tr);
	LinCongC(freq, a, c, m, { TiRand(0, m, tr) } ! 2) * 0.1
}.OverlapTexture(1, 2, 4).Mix

(* LinCongC ; rd edit ; https://github.com/lukiss/Losers-Union-SC-Research *)
let p = 9 / 7 ^ (0 .. 16);
let c = { :freq |
	LinCongC(freq, 1.1, 0.13, 1, 0)
};
let d = (c(c(p.arcTan) ^ 2 * 4) ^ 4 * 8).Abs;
let tr = c(c(d / p.arcTan).RoundTo(1 / d) ^ 4 * d * 8).Sin;
let f = TRand(0, 64, tr).Ceiling.MidiCps;
SinOsc(f, 0).Splay * 0.1
