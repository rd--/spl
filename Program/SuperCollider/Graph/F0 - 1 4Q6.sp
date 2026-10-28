/* http://sccode.org/1-4Q6 (F0) ; risset ; requires=LinRand */
{ :tr |
	let pan = tRand(-1, 1, tr);
	let freq = tRand(90, 2000, tr);
	let amp = tRand(0.1, 0.2, tr);
	let dur = tLinRand(0.5, 9, 1, tr);
	let ampList = [1 0.67 1 1.8 2.67 1.67 1.46 1.33 1.33 1 1.33];
	let durList = [1 0.9 0.65 0.55 0.325 0.35 0.25 0.2 0.15 0.1 0.075];
	let freqList = [0.56 0.56 0.92 0.92 1.19 1.7 2 2.74 3 3.76 4.07];
	let detuneList = [0 1 0 1.7 0 0 0 0 0 0 0];
	let src = [1 .. 11].collect { :i |
		let env = perc(tr, 0.005, dur * durList[i], -4.5) * ampList[i];
		sinOsc(freq * freqList[i] + detuneList[i], 0) * amp * env
	};
	eqPan2(src.sum, pan)
}.overlapTexture(9, 0, 7).mix * 0.1
