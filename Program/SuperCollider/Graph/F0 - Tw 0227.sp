/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ ; 0227 */
let b = LfPulse(LfPulse(4 / 3, 0, 0.5) * 4, 0, 0.5).Lag2(0.01);
let c = 2 / (6 .. 9);
let d = (99 ^ b * LfPulse(c, 0, 0.5)).Lag(0.1);
Splay(
	SinOsc(d, 0) + (
		SinOsc(d * b / c, b * d) * (1 - c)
	)
) / 4
