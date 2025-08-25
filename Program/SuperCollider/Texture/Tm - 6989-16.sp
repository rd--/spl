/* https://scsynth.org/t/6989/16 ; Tm */
{
	let num = 20;
	let dur = 1 / 60;
	let osc = {
		let note = (
			SinOsc(LfNoise1(dur / 6).LinLin(-1, 1, 30, 1000), 0)
			*
			LfNoise1(dur).LinLin(-1, 1, 0.01, 8)
		);
		let freq = Rand(30, 5000) * note.MidiRatio;
		let sig = Select(
			LfNoise0(dur).LinLin(-1, 1, 0, 2).Round,
			[
				SinOsc(freq, 0),
				Saw(freq),
				Pulse(freq, 0)
			] * 0.1
		);
		let filtFreq = Rand(30, 1000) * LfNoise1(dur).LinLin(-1, 1, 1, 5);
		let filt = Select(
			LfNoise0(dur).LinLin(-1, 1, 0, 2).Round,
			[
				Lpf(sig, filtFreq),
				Hpf(sig, filtFreq),
				Bpf(sig, filtFreq, 1)
			]
		);
		CombL(sig, 0.5, LfNoise1(dur / 6).LinLin(-1, 1, 0.02, 0.5), Rand(0.3, 2))
	} ! num;
	let sig = osc.Splay2;
	FreeVerb2(
		sig.first,
		sig.second,
		LfNoise1(dur).LinLin(-1, 1, 0, 1),
		LfNoise1(dur * 3).LinLin(-1, 1, 0.2, 2),
		0.5
	)
}.overlapTextureProgram(9, 3, 2)
