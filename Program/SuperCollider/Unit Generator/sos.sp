/* sos */
voicer(1, 16) { :e |
	let b1 = linLin(e.y, 0, 1, 1.45, 1.998);
	let b2 = linLin(e.x, 0, 1, -0.999, -0.9998);
	eqPan2(sos(trig(k2A(e.w), 0), 0.0, 0.05, 0.0, b1, b2), e.i * 2 - 1) * 8
}.mix

/* sos */
voicer(1, 16) { :e |
	let freq = (e.x * 25 + 48).midiCps;
	let rq = 0.002 + (e.y * 0.004);
	let b1 = 1.987 * 0.9889999999 * 0.09.cos;
	let b2 = -0.998057;
	let im = decay(trig1(k2A(e.w), sampleDur()), 0.1);
	let s1 = sos(im, 0.3, 0.0, 0.0, b1, b2);
	let s2 = rhpf(s1 * 0.8, freq, rq);
	let s3 = s2 + delayC(rhpf (s1 * 0.9, freq * 0.99999, rq * 0.999), 0.02, 0.01223);
	let s4 = decay2(s3, 0.4, 0.3) * s2;
	eqPan2(s4, e.i * 2 - 1) * e.z * 0.25
}.mix
