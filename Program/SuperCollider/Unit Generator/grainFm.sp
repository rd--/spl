/* grainFm ; Event control */
Voicer(1, 16) { :e |
	let tr = impulse(e.y * 64 + 10, 0);
	let cf = (e.p * 127 + e.j).midiCps;
	let mf = (cf * 1.5) + ((1 - e.x) * e.z * cf);
	grainFm(2, tr, e.k * 0.25, cf, mf, 1 + (e.j * 0.25), e.i, -1, 512) * e.z * lagUd(e.w, 0, 2)
}.mix
