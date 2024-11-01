/* Noise modulated sines ; Jmcc ; #6 */
{
	let f = (60 + 40.Rand0).MidiCps;
	let z = SinOsc([f, f + 0.2], 0) * LfNoise2(f * [0.15, 0.16]) * 0.1;
	CombN(z, 0.3, 0.3, 4) + z.reversed
}.overlapTextureProgram(4, 4, 4)
