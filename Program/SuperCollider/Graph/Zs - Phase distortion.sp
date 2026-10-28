/* http://schollz.com/blog/phasedistortion/ ; Event control */
Voicer(1, 16) { :e |
	let freq = (e.x * 36 + 48).midiCps; /* e.p.unitCps */
	let amp = e.z;
	let freqBase = freq;
	let freqRes = linLin(sinOsc(rand(0, 0.2), 0), -1, 1, freqBase / 2, freqBase * 2);
	let pdBase = impulse(freqBase, 0);
	let pd = phasor(pdBase, 2.pi * freqBase / sampleRate(), 0, 2.pi, 0);
	let pdRes = phasor(pdBase, 2.pi * freqRes / sampleRate(), 0, 2.pi, 0);
	let pdi = linLin((2.pi - pd).max(0), 0, 2.pi, 0, 1);
	let snd = lag(sinOsc(0, pdRes) * pdi, 1 / freqBase);
	let env = decay2(trig(e.w, sampleDur()), 0.005, 10);
	eqPan2(snd, e.i * 2 - 1) * env * amp
}.mix
