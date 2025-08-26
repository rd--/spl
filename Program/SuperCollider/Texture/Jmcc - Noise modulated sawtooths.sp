/* Noise modulated sawtooths (Jmcc) #6 */
{
	let f = Rand(60, 100).MidiCps;
	let z = LfSaw([f, f + 0.2], 0) * LfNoise2(f * [0.15, 0.16]) * 0.1;
	CombN(z, 0.5, 0.5, 4) + z.reverse
}.overlapTextureProgram(4, 4, 4)
