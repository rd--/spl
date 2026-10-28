/* Sample and hold liquidities (Jmcc) #4 */
let r = mouseX(1, 200, 1, 0.1);
let t = r.reciprocal;
let c = impulse(r, 0) * 0.4;
let cf = mouseY(100, 8000, 1, 0.1);
let i = eqPan(
	sinOsc(latch(whiteNoise() * cf * 0.5 + cf, c), 0),
	latch(whiteNoise(), c)
) * decay2(c, 0.1 * t, 0.9 * t);
combN(i, 0.3, 0.3, 2)
