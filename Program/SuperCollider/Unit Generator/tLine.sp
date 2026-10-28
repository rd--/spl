/* tLine */
let tr = impulse(1, 0);
let f0 = tRand(220, 330, tr);
let f1 = tRand(110, 440, tr);
let dur = tRand(0.1, 1, tr);
let f = tLine(f0, f1, dur, tr);
let e = sine(tr, dur) * 0.1;
sinOsc(f, 0) * e

/* tLine ; https://scsynth.org/t/6371/12 */
let x = mouseX(10, 100, 1, 0.2);
let y = mouseY(0.01, 0.05, 1, 0.2);
{
	let i = impulse(x + (x * lfNoise2(0.1) * 0.1), 0);
	let m = tRand(0.95, 1.05, i);
	let t = tLine(-1.5, 1.5, 0.01 * m, i);
	let c = ((10 * (2.pi * 5 * t).cos) + (5 * (2.pi * 40 * t).cos)) * (-1.pi * t.square).exp;
	c * y
} ! 2
