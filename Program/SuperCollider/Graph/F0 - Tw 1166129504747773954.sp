/* http://twitter.com/redFrik/status/1166129504747773954 */
let z = [0 .. 2];
let f = z.collect { :i |
	i + 3.33 + lfTri(3 / 3333, 0)
} % 3 * 33 * (3 / 3.pi + lfPulse(0.003 * 3, 0, 0.5));
let p = lfTri(3 * 3 ^ [3.3, 3] + (lfTri([3, 1.pi], 0)), 3);
let q = p * (lfPulse(1.pi, 0, 0.5) / 3 * lfTri(0.003, 0));
let r = ((lfTri(f, 3) * z.collect { :i |
	i + 3
}).product.tanh * [3, 333 * lfTri(3 / 3333, 0), 33]).splay2.sin + q / 3;
r + z.collect { :i |
	pitchShift(r, 3 / 33, 3 / 3 + i * 3, 3 / 33, 3 / 33)
}.mix / 9
