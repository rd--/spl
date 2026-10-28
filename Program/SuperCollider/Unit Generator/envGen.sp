/* envGen ; curve=3=sin */
let trg = impulse(1 / 9, 0);
let env = Env([0, 0.1, 0.1, 0], [3, 2, 3], 3, nil, nil, 0);
sinOsc(440, 0) * envGen(trg, 1, 0, 1, 0, env)

/* envGen ; if gate < 0 then the envelope will end immediately with release time set to 0 - gate + 1 */
let gate = linLin(lfPulse(0.25, 0, 0.1), -1, 1, mouseX(-25, 0, 0, 0.2), 1);
pinkNoise() * asr(gate, 0.01, 1, -4) * 0.1

/* envGen ; https://scsynth.org/t/6348/3 */
let ln = [
	75 27 3.0;
	66 26 3.5;
	50 21 3.0;
	90 21 4.0
];
let trig = impulse(1 / [4, 5], 0);
let pairs = duty(trig, 0.0, drand(Infinity, ln));
let env = Env(
	[pairs.first, pairs.first, pairs.second],
	[0, pairs.third],
	[-4],
	nil,
	nil,
	0
).asEnvGen(trig);
sinOsc(env.kr * 2, 0) * 0.25
