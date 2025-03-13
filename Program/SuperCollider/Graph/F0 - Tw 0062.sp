/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0062 */
let b = (1 .. 9);
Splay(
	SinOsc(b * 55, 0).Clip(
		SinOsc(2 / b, 0) * 0.5,
		SinOsc(3 / b, 0) * 0.5 + 1
	) * (
		SinOsc(b * 55 + (4 / b), 0) * SinOsc(1 / b, 0) * 6
	).Tanh
) / 5
