/* http://sccode.org/1-4Qy (F0) ; 0345 */
[0 .. 7].collect { :i |
	let c = sinOsc(8 - i / 8, 0);
	let p = sinOsc(1 + i, 0).max(c);
	let q = sinOsc(i - 2.1, 0) % sinOsc(9, 1) + (sinOsc(1, 0) > 0 / 3 + 1.83) ^ i + 99;
	let r = sinOsc(q, c + 1 / 4);
	p * r
}.splay / 2
