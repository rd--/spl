/* https://sonomu.club/@lukiss/113793194275567844 (Lnu) */
let f = 443;
let s = [0 2 4 6 7 9 11];
let m = s.degreeToKey([-14 .. 14; 2], 12);
let p = m.midiRatio;
splay2(
	sinOsc(
		f / 2 * p,
		(
			sinOsc(
				f * p * (sinOsc(p, 0) * 0.01 + 1),
				0
			) * sinOsc(
				p / p.radiansToDegrees,
				0
			)
		).max(0) ^ 2 * 1.pi
	) * sinOsc(p.degreesToRadians, 0).max(0) / 3
)
