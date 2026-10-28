/* http://sccode.org/1-4Qy (F0) ; 0296 */
let f = [0 .. 7].collect { :i |
	let p = sinOscFb(2 ^ (1 / 8) ^ i, i / 8) * sinOscFb(i + 8 / 8, 0);
	let q = sinOscFb(i + [2, 3] / 88, 0);
	p > q
}.sum * 88;
hpf(combN(sinOscFb(f, sinOscFb(1 / 18, 1)), 0.2, 0.2, 1), 8) / 3
