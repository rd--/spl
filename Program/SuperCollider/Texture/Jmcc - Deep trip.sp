/* Deep Trip (Jmcc) #9 */
{
	let f = (LfNoise1(Rand(0, 0.3)) * 60 + 70).MidiCps;
	let a = Times(
		LfNoise2(f * Rand(0, 0.5)),
		[
			LfNoise1(Rand(0, 8)),
			SinOsc(Rand(0, 40), 0),
			0.1
		].product.Max(0)
	);
	let s = EqPan(SinOsc(f, 0) * a, LfNoise1(Rand(0, 5)));
	let c = {
		CombN(s, 0.5, { Rand(0.2, 0.5) } ! 2, 20)
	} ! 2;
	s + c.Sum
}.overlapTextureProgram(12, 4, 4)
