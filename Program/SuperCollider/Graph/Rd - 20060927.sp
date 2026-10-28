/* 200060927 ; rd ; texture */
{ :tr |
	let e = decay2(
		impulse({ tRand(10, 13, tr) } ! 2, 0),
		tRand(0.001, 0.01, tr),
		tRand(0.005, 0.02, tr)
	);
	let f = { tRand(4, 7, tr) } ! 2 * sinOsc({ tRand(10, 13, tr) } ! 2, 0) * e;
	let r = { tRand(2220, 2227, impulse(0.7, 0)) } ! 2;
	sinOsc(r, 0) * f * 0.15
}.overlapTexture(2, 4, 2).mix
