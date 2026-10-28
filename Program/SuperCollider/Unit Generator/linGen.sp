/* linGen */
let env = linGen(1, [2 0.5], [1]);
sinOsc(440 * env, 0) * 0.1

/* linGen */
voicer(1, 16) { :e |
	let freq = linGen(e.w, e.p.unitCps * [2, 2, 0.5], [0.01, 1]);
	sinOsc(freq, 0) * e.z * e.w
}.sum

/* linGen */
let env = linGen(impulse(4, 0), [0 1 1 0], [0.001 0.05 0.1]);
sinOsc(440 * env, 0) * 0.1
