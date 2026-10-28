/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0170 */
let b = [2 3];
let c = sinOsc(
	0,
	sinOsc(b, 0) * 400
) * sinOsc(b / 4.1, 0);
c + sinOsc(
	b * 99 * amplitude(c, 0, 1 / 7),
	0
) + (
	greyNoise()
	*
	combN(c, 1, b / 3, 1)
) / 2
