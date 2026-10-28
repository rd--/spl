/* 20060914 ; rd ; Graph rewrite ; requires=Sine ; requires=arrayedEnv ; packet size */
{ :tr |
	let chrd = { :m |
		let ds = 3;
		let du = [5 4 5 7 4 5];
		let d = du * ds;
		eqPan2(
			sinOsc(txLine(m, m + tRand(0.05, 0.5, tr), d, tr).midiCps, 0),
			txLine(tRand(-1, 1, tr), tRand(-1, 1, tr), d, tr)
		).sum * sine(tr, du.max * ds) * tRand(0.005, 0.01, tr)
	};
	let scale = [0 2 4 5 7 9 11];
	let octaves = [4 5 6 7];
	let mnn = scale.collect { :n |
		octaves.collect { :o |
			n + (o * 12)
		}
	}.++;
	let chd = {
		tChoose(tr, mnn)
	} ! 6;
	{
		chrd(chd)
	} !+ 7
}.overlapTexture(21, 0, 3).mix
