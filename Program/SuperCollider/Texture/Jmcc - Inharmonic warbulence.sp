/* Inharmonic warbulence (Jmcc) #12 */
{
	let f = rand(24, 96).midiCps;
	let a = 1.min(500 / f);
	let r = xLine(expRand(0.1, 20), expRand(0.1, 20), 25.6);
	let n = 12;
	let z = {
		let g = rand(1, n + 1);
		let m = 0.max(
			sinOsc(r * rand(0.9, 1.1), rand(0, 2.pi)) * 0.08 - 0.04
		);
		eqPan(fSinOsc(f * g, 0) * m * (2 / g), rand(-1, 1))
	} !+ n * a;
	{
		combN(z, 0.3, { rand(0.1, 0.3) } ! 2, 8)
	} !+ 5 * 0.3
}.overlapTextureProgram(12.8, 6.4, 6)
