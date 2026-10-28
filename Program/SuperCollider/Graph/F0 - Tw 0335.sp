/* http://sccode.org/1-4Qy (F0) ; 0335 */
let o = grainFm(
	1,
	lfSaw([0.5, 0.6], 0),
	16,
	lfSaw(5, 0) * lfSaw(0.015, 0) + 1 * 98,
	(2 ^ lfSaw(4, 0)).round(0.5) * 99,
	2 ^ lfSaw(1 / [8, 9], 0) * 8,
	0,
	-1,
	512
);
(o / 2).tanh
