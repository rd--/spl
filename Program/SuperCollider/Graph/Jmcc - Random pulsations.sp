/* Random pulsations (Jmcc) #1 ; Graph rewrite */
{ :tr |
	let o1 = sinOsc(tRand(0, 2000, tr), 0);
	let o2 = sinOsc(8 + tRand(0, 80, tr), 0);
	let o3 = sinOsc(0.3 + tRand(0, 0.5, tr), tRand(0, 2.pi, tr)) * 0.7;
	eqPan2(o1.amClip(o2), o3) * 0.05
}.overlapTexture(5, 2, 6).mix
