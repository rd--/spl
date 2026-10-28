/* http://twitter.com/redFrik/status/1562193233001623552 ; F0 */
let c = sinOscFb(1 / 64, 0).round(1) * 10 + 50;
let o = sinOscFb((sinOscFb([1 .. 5], 1) * 3).round(1) + 5 * c, 1);
let p = o * sinOscFb(12, 1).max(1) * 3;
let q = sinOscFb(c, 0.7) * (sinOscFb(3, 1).min(0) / 3);
[0 .. 11].collect { :i |
	let p = sinOscFb(
		(i + 1 * c) + (sinOscFb(2.02, 1) * 2),
		sinOscFb(i + 1 / 24, 1) + 1 / 2
	) * sinOscFb(i + 1 / 16, 1);
	let q = sinOscFb(
		i + 1 * 50.05 ^ sinOscFb(6, 1),
		1
	) * sinOscFb(i + 1 / 36, 1);
	p % q
}.mean.tanh + splay2(p.tanh / 9) + q
