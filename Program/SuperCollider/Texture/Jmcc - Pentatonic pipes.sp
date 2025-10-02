/* Pentatonic pipes (Jmcc) #9 ; mousex on right half of screen causes pulsation ; requires=kr */
let n = 5;
let mode = [0 3 5 7 10].asLocalBuf;
let root = 36 + 0:12.atRandom;
{
	let f = (DegreeToKey(mode, 20.IRand0, 12) + root).MidiCps;
	let s = EqPan((Resonz(PinkNoise() * 20, f, 0.002) * 4).Distort * 0.2, 1.Rand2);
	let z = s * LinXFade2(1, SinOsc(5, 0).Max(0), MouseX(0, 1, 0, 0.2) > 0.5).kr; /* pulsing */
	system.coin(1 / 20).ifTrue {
		root := 36 + 0:12.atRandom /* maybe shift */
	};
	CombN(z, 0.3, 0.3, 8) + z.reverse
}.overlapTextureProgram(10, 0.01, n)
