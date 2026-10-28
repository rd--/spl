/* Pentatonic pipes (Jmcc) ; mousex on right half of screen causes pulsation ; requires=kr */
let n = 5;
let mode = [0 3 5 7 10].localBuf;
let root = 36 + 12.atRandom;
let z = { :tr |
	let m = degreeToKey(mode, tRand(0, 20, tr), 12) + root;
	let o = resonz(pinkNoise() * 20, m.midiCps, 0.002) * 4;
	eqPan2(
		o.distort * 0.2,
		tRand(-1, 1, tr)
	)
}.overlapTexture(10, 0.1, n).mix;
z := z * linXFade2(dc(1), sinOsc(5, 0).max(0), mouseX(0, 1, 0, 0.2) > 0.5).kr;
combN(z, 0.3, 0.3, 8) + z.reverse
