/* Hard sync sawtooth with lfo (Jmcc) #6 */
{
	let f = rand(30, 80).midiCps;
	let z = syncSaw(
		[f, f + 0.2],
		sinOsc(0.2, [0, rand(0, 2.pi)]) * 2 * f + (3 * f)
	) * 0.05;
	combN(z, 0.3, 0.3, 4) + z.reverse
}.overlapTextureProgram(4, 4, 4)
