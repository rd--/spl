/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0062 */
let b = [1 .. 9];
splay(
	sinOsc(b * 55, 0).clip(
		sinOsc(2 / b, 0) * 0.5,
		sinOsc(3 / b, 0) * 0.5 + 1
	) * (
		sinOsc(b * 55 + (4 / b), 0) * sinOsc(1 / b, 0) * 6
	).tanh
) / 5
