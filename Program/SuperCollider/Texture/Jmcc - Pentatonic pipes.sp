/* Pentatonic pipes (Jmcc) #9 ; mousex on right half of screen causes pulsation ; requires=kr */
let n = 5;
let mode = [0 3 5 7 10].localBuf;
let root = 36 + [0 .. 12].atRandom;
{
	let f = (degreeToKey(mode, iRand(0, 20), 12) + root).midiCps;
	let s = eqPan((resonz(pinkNoise() * 20, f, 0.002) * 4).distort * 0.2, rand(-1, 1));
	let z = s * linXFade2(dc(1), sinOsc(5, 0).max(0), mouseX(0, 1, 0, 0.2) > 0.5).kr; /* pulsing */
	system.coin(1 / 20).ifTrue {
		root := 36 + [0 .. 12].atRandom /* maybe shift */
	};
	combN(z, 0.3, 0.3, 8) + z.reverse
}.overlapTextureProgram(10, 0.01, n)
