/* http://sccode.org/1-4Qy (F0) ; 0299 */
let c = 3 ^ lfSaw([2, 3], [0, 1]);
let p = formant(
	lfSaw(1 / 16, 0).round(c) + 3 * 33 * c.ceiling,
	3 ^ lag(c, 0.1) * 66,
	3 ^ c * 99
);
let q = formant(c + 3, 1 - c * 3000, 880);
p * q / 3
