/* http://twitter.com/headcube/status/528187147543511041 (nv) */
[1 .. 4].collect { :j |
	let f = 32 ^ [1 .. 10].collect { :i |
		let n = lfNoise0(0.25 ^ (j - 1) / 8);
		let p = lfPulse(2 ^ (i - 1) / 8, 0, 0.5);
		1 / 4 ^ (i - 1) * (n > 0 - p).abs
	}.sum * 30;
	eqPan2(rlpf(pulse(f, 0.3), lag(f.signedSqrt, 2) * 30, 0.5), 0) * 0.2
}.mix * 0.25
