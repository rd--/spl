/* https://scsynth.org/t/6989/16 ; Tm */
{
	let num = 20;
	let dur = 1 / 60;
	let osc = {
		let note = (
			sinOsc(lfNoise1(dur / 6).linLin(-1, 1, 30, 1000), 0)
			*
			lfNoise1(dur).linLin(-1, 1, 0.01, 8)
		);
		let freq = rand(30, 5000) * note.midiRatio;
		let sig = selectT(
			lfNoise0(dur).linLin(-1, 1, 0, 2).round(1),
			[
				sinOsc(freq, 0),
				saw(freq),
				pulse(freq, 0)
			] * 0.1
		);
		let filtFreq = rand(30, 1000) * lfNoise1(dur).linLin(-1, 1, 1, 5);
		let filt = selectT(
			lfNoise0(dur).linLin(-1, 1, 0, 2).round(1),
			[
				lpf(sig, filtFreq),
				hpf(sig, filtFreq),
				bpf(sig, filtFreq, 1)
			]
		);
		combL(sig, 0.5, lfNoise1(dur / 6).linLin(-1, 1, 0.02, 0.5), rand(0.3, 2))
	} ! num;
	let sig = osc.splay2;
	freeVerb2(
		sig.first,
		sig.second,
		lfNoise1(dur).linLin(-1, 1, 0, 1),
		lfNoise1(dur * 3).linLin(-1, 1, 0.2, 2),
		0.5
	)
}.overlapTextureProgram(9, 3, 2)
