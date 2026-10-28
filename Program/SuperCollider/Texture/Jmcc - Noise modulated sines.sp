/* Noise modulated sines ; Jmcc ; #6 */
{
	let f = (60 + rand(0, 40)).midiCps;
	let z = sinOsc([f, f + 0.2], 0) * lfNoise2(f * [0.15, 0.16]) * 0.1;
	combN(z, 0.3, 0.3, 4) + z.reverse
}.overlapTextureProgram(4, 4, 4)
