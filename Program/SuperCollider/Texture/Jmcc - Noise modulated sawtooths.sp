/* Noise modulated sawtooths (Jmcc) #6 */
{
	let f = rand(60, 100).midiCps;
	let z = lfSaw([f, f + 0.2], 0) * lfNoise2(f * [0.15, 0.16]) * 0.1;
	combN(z, 0.5, 0.5, 4) + z.reverse
}.overlapTextureProgram(4, 4, 4)
