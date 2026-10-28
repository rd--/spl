/* Bowed string (Jmcc) ; texture ; Graph rewrite */
{ :tr |
	let root = 5;
	let scale = [0 2 4 5 7 9 11] + root;
	let oct = [24 36 48 60 72 84];
	let f = (tChoose(tr, scale) + tChoose(tr, oct)).midiCps;
	let e = (lfNoise1(tExpRand(0.125, 0.5, tr)) * 0.6 + 0.4).max(0);
	let x = brownNoise([0.007] # 2, 0) * e;
	let k = dynRingzBank(
		x,
		12.arithmeticProgression(f, f),
		12.geometricProgression(1, tRand(0.7, 0.9, tr)),
		{ tRand(1, 3, tr) } ! 12
	);
	eqPan2(k.softClip, tRand(-1, 1, tr)) / 10
}.overlapTexture(5, 2, 9).mix
