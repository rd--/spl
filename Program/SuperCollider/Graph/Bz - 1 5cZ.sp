/* http://sccode.org/1-5cZ ; bz (bernardo zitto) ; graph edit */
{ :tr |
	let n = 16;
	let sig = {
		let q = tRand(
			tRand(0.1, 0.5, tr),
			tRand(0.1, 0.5, tr),
			tr
		);
		let env = lfNoise1(tRand(1, 2, tr)) * tRand(1, 2, tr) + tRand(-2, 0, tr);
		bpf(
			dust2(tRand(12, 160, tr)) * env,
			tRand(tRand(100, 200, tr), tRand(200, 2500, tr), tr),
			q
		) / q.signedSqrt
	} ! n;
	((sig * tRand(1, 2, tr)).tanh * 0.5).splay2
}.overlapTexture(4, 4, 4).mix
