/* dc */
dc(0)

/* dc ; Silence at left, sinOsc at right */
[dc(0), sinOsc(440, 0)] * 0.1

/* dc ; Silence at first eight channels, random sine tones at next eight */
{ :tr |
	let p = { dc(0) } ! 8;
	let q = { sinOsc(tRand(220, 880, tr), 0) } ! 8;
	(p ++ q) * 0.1
}.overlapTexture(2, 5, 2).sum
