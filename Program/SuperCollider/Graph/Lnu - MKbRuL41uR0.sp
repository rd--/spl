/* https://www.youtube.com/watch?v=mKbRuL41uR0 ; lnu */
let f = 40 * [1 .. 33; 2];
let c = LatoocarfianL(4, 1, 3, 0.5, 0.5, 0.5, 0.5).expRange(0.01, 1).HanWindow * 8;
let t = 2 ^ (LatoocarfianL(c, 1, 3, 0.5, 0.5, 0.5, 0.5) * 2 + 1).ceiling;
let e = (LfSaw(-1 * t, 1) * 1 + 1 / 2 ^ t).Lag3(0.005);
let d = LatoocarfianL(t ^ t * (f / f.sum), 1, 3, 0.5, 0.5, 0.5, 0.5).tanh.expRange(0.01, 1) * (t ^ 2 );
let g = ((LfSaw(-1 * e ^ t, 1) * f.log2) * d * e).sin.abs;
Splay(
	Bpf(
		LfSaw(f + (LfPulse(f * 8, 1, 1 - (e)) / 2 ^ (t * 2) * f * t), 0) ^ (e ^ 2 * (t + t)),
		g * (e ^ (t / 8) * 11000) + 40,
		1.2 - e
	),
	t.sin
).tanh / 4
