/* http://scsynth.org/t/6264/4 ; pt */
let numPartials = 24;
let numVoices = 16;
let partialList = [1 .. numPartials];
let detune = 0.2;
voicer(1, numVoices) { :e |
	let detuneList = ([lfNoise1(0.2)] # numPartials * detune).midiRatio;
	let freqEnv = txLine(1 - e.y * 2, 1, partialList ^ 0.7 / 10, e.w);
	let freq0 = e.p.unitCps;
	let freqList = freq0 * partialList * detuneList * freqEnv;
	let osc = sinOsc(freqList, { tRand(0, 2.pi, e.w) } ! numPartials);
	let dampen = 0.9 * (1 - e.z);
	let sig = osc / (partialList ^ dampen.max(0.01));
	let atk = e.y + 0.1 * (partialList ^ 0.6) * ({ tRand(0.5, 1.5, e.w) } ! numPartials);
	let rel = e.y + 0.1 * 14 / (partialList + 3 ^ 0.9) * ({ tExpRand(0.5, 2, e.w) } ! numPartials);
	let envs = perc(e.w, atk, rel, -4);
	eqPan2((sig * envs).sum, e.i)
}.sum * 0.1
