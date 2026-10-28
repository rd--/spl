/* Fast lfos with slow beats */
{ :tr |
	let a0 = tRand(40, 240, tr);
	let a1 = a0 + tRand(-1, 1, tr);
	let a = [a0, a1];
	let b = tRand(0, 2000, tr);
	let c = { tRand(-1, 1, tr) } ! 2 + a;
	sinOsc(sinOsc(a, 0) * tRand(0, 1, tr) * b + b, 0) * (sinOsc(c, 0) * 0.05 + 0.05)
}.overlapTexture(8, 4, 4).mix * 0.25
