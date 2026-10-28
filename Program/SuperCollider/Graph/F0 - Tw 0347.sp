/* http://sccode.org/1-4Qy (F0) ; 0347 */
[0 .. 29].collect { :i |
	let c = i / 48;
	let b = c / 72;
	varSaw(
		(lfSaw(c, 0) * lfSaw(b, 0) * 8 + 9).round(i % 9 + 1) * 25 + c,
		c,
		lfSaw(3, i) + 1 / 3
	) * (lfSaw(b, i / 1.pi) % 1) / 2
}.splay
