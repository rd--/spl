/* https://sonomu.club/@lukiss/113793194275567844 (Lnu) */
let f = 443;
let s = [0 2 4 6 7 9 11];
let m = (-14, -12 .. 14).degreeToKey(s, 12);
let p = m.MidiRatio;
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
		).Max(0) ^ 2 * pi
	) * SinOsc(p.degreesToRadians, 0).Max(0) / 3
)
