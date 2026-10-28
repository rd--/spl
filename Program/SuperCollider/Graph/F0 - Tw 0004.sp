/* http://sccode.org/1-4Qy ; tweet0004 ; texture variant (rd) */
{ :tr |
	let z = tRand(6, 26, tr);
	let y = lfTri(z, 0).abs / 9 / z;
	rlpf(tDuty(y, 0, y), z * 600, 0.06) * [9, 9]
}.overlapTexture(6, 10, 2).mix
