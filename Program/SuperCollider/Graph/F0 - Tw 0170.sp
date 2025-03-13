/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0170 */
let b = [2 3];
let c = SinOsc(
	0,
	SinOsc(b, 0) * 400
) * SinOsc(b / 4.1, 0);
c + SinOsc(
	b * 99 * Amplitude(c, 0, 1 / 7),
	0
) + (
	GrayNoise()
	*
	CombN(c, 1, b / 3, 1)
) / 2
