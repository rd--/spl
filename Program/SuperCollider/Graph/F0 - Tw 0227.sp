/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ ; 0227 */
let b = lfPulse(lfPulse(4 / 3, 0, 0.5) * 4, 0, 0.5).lag2(0.01);
let c = 2 / [6 .. 9];
let d = (99 ^ b * lfPulse(c, 0, 0.5)).lag(0.1);
splay(
	sinOsc(d, 0) + (
		sinOsc(d * b / c, b * d) * (1 - c)
	)
) / 4
