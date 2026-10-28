/* Deep trip (Jmcc) #9 ; Graph rewrite (Rd) */
{ :tr |
	let f = (lfNoise1(tRand(0, 0.3, tr)) * 60 + 70).midiCps;
	let a = lfNoise2(f * tRand(0, 0.5, tr)) * (lfNoise1(tRand(0, 8, tr)) * sinOsc(tRand(0, 40, tr), 0) * 0.1).max(0);
	let z = sinOsc(f, 0) * a;
	let s = pan2(z, lfNoise1(tRand(0, 5, tr)), 1);
	{
		combN(s, 0.5, { tRand(0, 0.2, tr) + 0.3 } ! 2, 20)
	} !+ 2 + s
}.overlapTexture(12, 4, 4).mix
