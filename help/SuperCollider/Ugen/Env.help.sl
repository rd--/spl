{- Env ; asEnvGen -}
let levels = [440 440 324 10000];
let times = [4 2 1];
let curves = 2;
let env = Env(levels, times, curves, nil, nil, 0);
let freq = env.asEnvGen(1);
SinOsc(freq, 0) * 0.1

{- Env ; EnvGen -}
let e = Env([440 440 324 10000], [4 2 1], 2, nil, nil, 0);
let f = EnvGen(1, 1, 0, 1, 2, e.asList);
SinOsc(f, 0) * 0.1

{- Env ; circle -}
let env = Env([6000 700 100], [1 1], ['exp', 'lin'], nil, nil, 0).circle(0, 'lin');
SinOsc(
	env.asEnvGen(1),
	0
) * 0.1 + Impulse(1, 0)

{- Env ; circle -}
let env = Env([6000 700 100], [1 1], ['exp', 'lin'], nil, nil, 0).circle(1, 'lin');
SinOsc(
	env.asEnvGen(MouseX(-1, 1, 0, 0.2)),
	0
) * 0.1 + Impulse(1, 0)

{- Env ; requires=keywords -}
let e = Env(
	levels: [440 440 324 10000],
	times: [4 2 1],
	curves: 2,
	releaseNode: nil,
	loopNode: nil,
	offset: 0
);
let f = EnvGen(
	gate: 1,
	levelScale: 1,
	levelBias: 0,
	timeScale: 1,
	doneAction: 2,
	envelope: e.asList
);
SinOsc(
	freq: f,
	phase: 0
) * 0.1

{- Env ; asEnvGenWithDoneAction -}
let e = Env([440 440 324 10000], [4 2 1], 2, nil, nil, 0);
let f = e.asEnvGenWithDoneAction(1, 2);
SinOsc(f, 0) * 0.1
