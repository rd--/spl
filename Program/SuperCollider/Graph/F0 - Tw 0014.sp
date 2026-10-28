/* Tw 0014 (F0) ; http://twitter.com/redFrik/status/24193534033 */
[1 .. 9].collect { :i |
	let a0 = sinOscFb(i + 1, 1 / 9) * 999;
	let a1 = sinOscFb(1 / 9, 1) / 9;
	let a2 = sinOscFb(a0, 1 / 9) * a1;
	let a3 = sinOscFb(0.1, 3);
	let a4 = sinOscFb(a2, a3) * (i + 2 * 999);
	let a5 = sinOscFb(1 / 9, 1 / 9);
	sinOscFb(a4, a5) / 9
}.splay * 0.35
