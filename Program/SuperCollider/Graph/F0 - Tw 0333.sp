/* http://sccode.org/1-4Qy (F0) ; 0333 */
[0 .. 7].collect { :i |
	let b = i + 2 * 99;
	let f = sinOscFb(i + 1 / 150, 0).round(1) + 1 + i * 99 + sinOscFb([3, 2], 0);
	(formant(f, b, b) * sinOscFb(i + 1 / 130, 0).max(0)).tanh
}.mix / 3
