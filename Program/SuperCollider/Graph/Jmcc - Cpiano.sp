/* Cpiano (Jmcc) ; Graph rewrite ; http://www.iamas.ac.jp/~aka/dspss2004/materials/ */
{ :tr |
	let dgr = degreeToKey(
		[0 2 4 5 7 9 11].localBuf,
		tRand(0, 12, tr),
		12
	);
	let freq = (60 + dgr).midiCps;
	let pan = tRand(-0.25, 0.25, tr);
	let amp = tRand(0.1, 0.2, tr);
	let hammerEnv = decay2(tr, 0.008, 0.04) * amp;
	let src = [0.997, 1.0, 1.002].collect { :detune |
		let hammer = lfNoise2(3000) * hammerEnv;
		let delayTime = (freq * detune).reciprocal;
		let decayTime = tRand(3, 6, tr);
		combL(hammer, delayTime, delayTime, decayTime)
	}.sum;
	eqPan2(src, pan) / 2
}.overlapTexture(2, 0, 9).mix
