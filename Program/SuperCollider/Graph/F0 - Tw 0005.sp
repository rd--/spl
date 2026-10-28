/* http://sccode.org/1-4Qy ; tweet0005 ; texture variant (rd) */
{ :tr |
	let z = tRand(1, 60, tr);
	let y = lfTri(z, 0).abs / z;
	{
		rlpf(tDuty(y, 0, y), z * 99 + y, 0.01) * (6 + y)
	} ! 2
}.overlapTexture(1, 25, 4).mix
