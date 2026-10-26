/* https://sonomu.club/@lukiss/113793194275567844 (Lnu) */
let f = 443;
let s = [0 2 4 6 7 9 11];
let m = [-14 .. 14; 2].degreeToKey(s, 12);
let p = m.midiRatio;
Splay2(
	SinOsc(
		f / 2 * p,
		(
			SinOsc(
				f * p * (SinOsc(p, 0) * 0.01 + 1),
				0
			) * SinOsc(
				p / p.radiansToDegrees,
				0
			)
		).max(0) ^ 2 * 1.pi
	) * SinOsc(p.degreesToRadians, 0).max(0) / 3
)
