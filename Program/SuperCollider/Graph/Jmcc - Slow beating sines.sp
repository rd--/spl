/* Slow beating sines (Jmcc) #7 ; Graph rewrite ; requires List>>add */
{ :tr |
	let n = 20;
	let p = [];
	let q = [];
	n.timesRepeat {
		let freq = tRand(24, 84, tr).midiCps;
		let d = 5;
		p.add!(freq);
		{ p.add!(freq + tRand(d.negate, d, tr)) } ! 2;
		{ q.add!(freq + tRand(d.negate, d, tr)) } ! 3
	};
	[p, q].collect { :freqList |
		freqList.collect { :freq |
			sinOsc(freq, tRand(0, 2.pi, tr))
		}.sum
	} * 0.1 / n
}.overlapTexture(4, 4, 2).mix
