# DemandEnvGen

- _DemandEnvGen(level, dur, shape=1, curve=0, gate=1, reset=1, levelScale=1, levelBias=0, timeScale=1, doneAction=0)_

Plays back break point envelope contours (levels, times, shapes) given by demand ugens.
The next values are called when the next node is reached.

Frequency envelope with random times:

```
let cubicInterpolation = 7;
let freq = DemandEnvGen(
	Dseq(inf, [204 400 201 502 300 200]),
	Drand(inf, [1.01 0.2 0.1 2]) * MouseY(0.01, 3, 1, 0.2),
	cubicInterpolation,
	0, 1, 1, 1, 0, 1, 0
);
SinOsc(freq * [1 1.01], 0) * 0.1
```

Frequency modulation:

```
let curveInterpolation = 5;
let list = { ExpRand(200, 1000) } ! 32;
let freq = DemandEnvGen(
	{ Dseq(inf, list.scramble) } ! 2,
	SampleDur() * MouseY(1, 3000, 1, 0.2),
	curveInterpolation,
	MouseX(-0.01, -4, 0, 0.2),
	1, 1, 1, 0, 1, 0
);
SinOsc(freq, 0) * 0.1
```

Gate, `MouseX` on right side of screen toggles gate:

```
let freq = DemandEnvGen(
	Dwhite(inf, 300, 1000).RoundTo(100),
	0.1,
	5,
	0.3,
	MouseX(0, 1, 0, 0.2) > 0.5,
	1, 1, 0, 1, 0
);
SinOsc(freq * [1 1.21], 0) * 0.1
```


Sample and hold (0.5 > gate > 0),
`MouseX` on right side of screen toggles gate,
`MouseY` scales frequency:

```
let freq = DemandEnvGen(
	Dwhite(inf, 300, 1000).RoundTo(100),
	0.1,
	5,
	0.3,
	MouseX(0, 1, 0, 0.2) > 0.5 + 0.1,
	1, 1, 0, 1, 0
);
SinOsc(freq * [1 1.21] * MouseY(0.25, 2, 0, 0.2), 0) * 0.1
```

Gate,
`MouseX` on right side of screen toggles gate,
`MouseButton` does soft reset:

```
let freq = DemandEnvGen(
	Dseq(2, [Dseries(5, 400, 200), 500, 800, 530, 4000, 900]),
	Dseq(inf, [0.2, 0.1, 0.2, 0.3, 0.1]),
	Dseq(inf, [1, 0, 0, 6, 1, 1, 0, 2]),
	0,
	MouseX(0, 1, 0, 0.2) > 0.5,
	MouseButton(0, 1, 0.2) > 0.5,
	1, 0, 1, 0
);
SinOsc(freq * [1, 1.001], 0) * 0.1
```

Hardsyncing a saw:

```
DemandEnvGen(
	Dseq(inf, [Dseries(20, -0.1, 0.01)]),
	SampleDur() * MouseY(1, 100, 1, 0.2),
	1,
	0,
	K2A(1),
	Impulse(MouseX(1, SampleRate() * MouseX(0.002, 1, 1, 0.2), 1, 0.2), 0) * 1.5,
	1, 0, 1, 0
)
```

Softsyncing a saw:


```
DemandEnvGen(
	Dseq(inf, [Dseries(20, -0.1, 0.01)]),
	SampleDur() * MouseY(1, 100, 1, 0.2),
	1,
	0,
	K2A(1),
	Impulse(MouseX(1, SampleRate() * MouseX(0.002, 1, 1, 0.2), 1, 0.2), 0) + [0, 0.3],
	1, 0, 1, 0
)
```

Multichannel expansion,
`MouseX` on right side of screen toggles gate,
`MouseY` controls speed:

```
let freq = DemandEnvGen(
	{ Dseq(inf, [300, 800, Drand(1, [1000, 460, 300]), 400]) + Rand(0, 3) } ! 2,
	MouseY(0.001, 2, 1, 0.2),
	5,
	-4,
	MouseX(0, 1, 0, 0.2) > 0.5,
	1, 1, 0, 1, 0
);
SinOsc(freq, 0) * 0.1
```

* * *

See also: Demand, Duty, EnvGen, TDuty

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/DemandEnvGen.html)

Categories: Ugen
