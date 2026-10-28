/* combC */
{ :tr |
	let chord = [60 63 67; 65 68 72; 55 58 62].atRandom;
	let note = { (chord.atRandom - [0 12 24].atRandom).midiCps } ! 2;
	let x = decay(tr, 1 + tRand(0.1, 0.3, tr)) * brownNoise() * 0.1;
	combC(x, 0.05, 1 / note, rand(1, 3))
}.overlapTexture(4, 1, 9).mix

/* combC ; noise burst as input signal ; function to create comb delays with random delay times */
let n = 8;
let z = decay2(
	impulse(0.5, 0),
	0.01,
	0.20
) * pinkNoise() * 0.1;
{
	combC(
		z,
		0.1,
		rand(0.01, 0.09),
		3
	)
} !^ n
