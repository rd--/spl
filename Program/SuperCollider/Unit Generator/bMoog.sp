/* bMoog ; Event control */
voicer(1, 16) { :e |
	let md = tiRand(0, 2, e.w);
	let f0 = linExp(e.x, 0, 1, 12, 12000);
	let sig = lfSaw([f0 * 0.99, f0 * 1.01], 0) * e.k * 0.4;
	let cf = sinOsc(sinOsc(0.1, 0), 1.5.pi).kr * e.j * 1550 + 1800;
	let flt = bMoog(sig, cf, e.y, md, 0.95);
	pan2(
		combN(flt, 0.5, [0.4, 0.35], 2) * 0.4 + (flt * 0.5),
		e.i * 2 - 1,
		lagUd(e.w, 0, 3) * e.z
	).sum
}.mix
