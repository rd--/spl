/* Hard sync sawtooth with lfo (Jmcc) #6 */
{
	let f = Rand(30, 80).MidiCps;
	let z = SyncSaw(
		[f, f + 0.2],
		SinOsc(0.2, [0, 2 * pi.Rand]) * 2 * f + (3 * f)
	) * 0.05;
	CombN(z, 0.3, 0.3, 4) + z.reversed
}.overlapTextureProgram(4, 4, 4)
