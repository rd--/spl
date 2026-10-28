/* Tmm881 ; http://scsynth.org/t/3319 ; Edit (rd) ; Event control */
let pre = voicer(1, 16) { :e |
	let freq = (e.x * 25 + 48).midiCps + [0, tRand(1, 4, e.w)];
	let carriers = [sinOsc(freq, 0), saw(freq), pulse(freq, 0.5)];
	let modulators = { sinOsc(tRand(0.0322, 1.0, e.w) * 0.0647, 0) } ! carriers.size;
	let filterEnv = Env([3600, 220, 3600], [e.y * 2, 16], 2, 1, nil, 0).asEnvGen(e.w);
	eqPan2(
		lpf((carriers * modulators).sum, filterEnv),
		e.i * 2 - 1
	).sum * lagUd(e.w * e.z, 0, 0.25)
}.sum;
freeVerb2(pre.first, pre.second, 0.33, 0.5, 0.5)
