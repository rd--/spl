/* https://twitter.com/redFrik/status/1746982829144113215 f0 */
let z = localIn(14, [1 / 4] ++ ([0] # 13));
let d = 0.14 * 1.4;
let h = hilbertTransform(
	lpf(
		hpf(
			z.rotate(-1),
			140
		),
		11400
	)
) * 1.4;
let l = localOut(delayN(h.transpose.second.sin, d, d / [1 .. 4]));
splay(z) <! l / 4
