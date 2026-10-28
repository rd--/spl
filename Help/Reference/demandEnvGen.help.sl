# demandEnvGen

- _demandEnvGen(level, dur, shape=1, curve=0, gate=1, reset=1, levelScale=1, levelBias=0, timeScale=1, doneAction=0)_

Plays back break point envelope contours (levels, times, shapes) given by demand ugens.
The next values are called when the next node is reached.

Frequency envelope with random times:

```
let cubicInterpolation = 7;
let y = mouseY(0.01, 3, 1, 0.2);
let freq = demandEnvGen(
	dseq(Infinity, [204 400 201 502 300 200]),
	drand(Infinity, [1.01 0.2 0.1 2]) * y,
	cubicInterpolation,
	0, 1, 1, 1, 0, 1, 0
);
sinOsc(freq * [1 1.01], 0) * 0.1
```

Frequency modulation:

```
let curveInterpolation = 5;
let y = mouseY(1, 3000, 1, 0.2);
let list = { expRand(200, 1000) } ! 32;
let freq = demandEnvGen(
	{ dseq(Infinity, list.scramble) } ! 2,
	sampleDur() * y,
	curveInterpolation,
	mouseX(-0.01, -4, 0, 0.2),
	1, 1, 1, 0, 1, 0
);
sinOsc(freq, 0) * 0.1
```

gate, `mouseX` on right side of screen toggles gate:

```
let freq = demandEnvGen(
	dwhite(
		Infinity,
		300,
		1000
	).round(100),
	0.1,
	5,
	0.3,
	mouseX(0, 1, 0, 0.2) > 0.5,
	1, 1, 0, 1, 0
);
sinOsc(freq * [1 1.21], 0) * 0.1
```

Sample and hold (0.5 > gate > 0),
`mouseX` on right side of screen toggles gate,
`mouseY` scales frequency:

```
let x = mouseX(0, 1, 0, 0.2);
let y = mouseY(0.25, 2, 0, 0.2);
let freq = demandEnvGen(
	dwhite(Infinity, 300, 1000).round(100),
	0.1,
	5,
	0.3,
	x > 0.5 + 0.1,
	1, 1, 0, 1, 0
);
sinOsc(freq * [1 1.21] * y, 0) * 0.1
```

gate,
`mouseX` on right side of screen toggles gate,
`mouseButton` does soft reset:

```
let freq = demandEnvGen(
	dseq(
		2,
		[
			dseries(5, 400, 200),
			500,
			800,
			530,
			4000,
			900
		]
	),
	dseq(Infinity, [0.2, 0.1, 0.2, 0.3, 0.1]),
	dseq(Infinity, [1, 0, 0, 6, 1, 1, 0, 2]),
	0,
	mouseX(0, 1, 0, 0.2) > 0.5,
	mouseButton(0, 1, 0.2) > 0.5,
	1, 0, 1, 0
);
sinOsc(freq * [1, 1.001], 0) * 0.1
```

Hardsyncing a saw:

```
let sr = sampleRate();
let x = mouseX(0.002, 1, 1, 0.2);
let xx = mouseX(1, sr * x, 1, 0.2);
let y = mouseY(1, 100, 1, 0.2);
demandEnvGen(
	dseq(Infinity, [dseries(20, -0.1, 0.01)]),
	sampleDur() * y,
	1,
	0,
	dc(1),
	impulse(xx, 0) * 1.5,
	1, 0, 1, 0
)
```

Softsyncing a saw:

```
let sr = sampleRate();
let x = mouseX(0.002, 1, 1, 0.2);
let xx = mouseX(1, sr * x, 1, 0.2);
let y = mouseY(1, 100, 1, 0.2);
demandEnvGen(
	dseq(Infinity, [dseries(20, -0.1, 0.01)]),
	sampleDur() * y,
	1,
	0,
	dc(1),
	impulse(xx, 0) + [0, 0.3],
	1, 0, 1, 0
)
```

Multichannel expansion,
`mouseX` on right side of screen toggles gate,
`mouseY` controls speed:

```
let freq = demandEnvGen(
	{
		dseq(
			Infinity,
			[
				300,
				800,
				drand(
					1,
					[1000 460 300]
				),
				400
			]
		) + rand(0, 3)
	} ! 2,
	mouseY(0.001, 2, 1, 0.2),
	5,
	-4,
	mouseX(0, 1, 0, 0.2) > 0.5,
	1, 1, 0, 1, 0
);
sinOsc(freq, 0) * 0.1
```

* * *

See also: demand, duty, envGen, tDuty

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/DemandEnvGen.html)

Categories: Ugen
