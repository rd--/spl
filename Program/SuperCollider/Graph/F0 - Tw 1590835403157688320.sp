/* http://twitter.com/redFrik/status/1590835403157688320 */
let b = [1 .. 9];
let g = 1 / b / 99;
let z = latch(
	whiteNoise().round(0.5) + 2,
	brownNoise() + 1.4 > sinOsc(b / 999, 0)
);
let r = rlpf(
	z,
	9 ^ sinOsc(g * 9, 0) * 999,
	sinOsc(b / 77, 0) / 2 + 0.6
);
let x = sinOsc(999 * b.scramble / r, 0);
let w = latch(
	whiteNoise(),
	brownNoise() + 1.3 > sinOsc(b / 99, 0)
);
let y = rlpf(
	w,
	9 ^ sinOsc(g, 0) * 999,
	sinOsc(b / 88, 0) / 2 + 0.6
);
splay(7 ^ sinOsc(g, 0) / 9 * x * y)
