/* http://sccode.org/1-4Qy ; tweet0002 (F0) ; graph variant */
[0 .. 98].collect { :i |
	let o = bpf(impulse(linRand(0.5, 18.5, 0), 0), linRand(0, 9999, 0), linRand(0, 0.3, 0)) * 5;
	let e = linSeg(1, [0, i * 3, 0, 0.01, 1, 2, 1, 9, 0]);
	eqPan2(o, rand(-1, 1)) * e
}.sum
