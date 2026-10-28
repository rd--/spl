/* Blips 001 (Jmcc) #SC3d1.5 ; Graph rewrite */
let z = { :tr |
	let blips = {
		let f = txLine(
			tExpRand(0.25, 400, tr),
			tExpRand(0.25, 400, tr),
			4,
			tr
		);
		let nh = tLine(
			tExpRand(2, 100, tr),
			tExpRand(2, 100, tr),
			4,
			tr
		);
		blip(f, nh)
	};
	eqPan2(
		blips() * blips(),
		tLine(
			tRand(-1, 1, tr),
			tRand(-1, 1, tr),
			4,
			tr
		)
	) * 0.3
}.overlapTexture(2, 1, 12).mix.distort;
6.timesRepeat {
	z := allpassN(z, 0.05, { rand(0, 0.05) } ! 2, 4)
};
z
