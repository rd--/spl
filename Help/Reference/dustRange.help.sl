# dustRange

- _dustRange(iotMin, iotMax)_

Inter-offset times generated randomly in indicated range with uniform distribution.
Bounds are specified in seconds.

Small inter-offset times generate noise,
equal bounds generate impulses:

```
let a = dustRange(0.0001, 0.001) * 0.1;
let b = dustRange(0.1, 0.1) * 0.5;
[a, b]
```

Audio rate impulse train of varying amplitude (min = max):

```
[
	dustRange(0.1, 0.1),
	impulse(10, 0)
] * 0.1
```

A mean inter-offset time equal to 0.0005 is equivalent to a density of 2000 at `dust`.
`dustRange` spacing is more uniform:

```
[
	dustRange(0.0001, 0.001) * 0.1,
	dust(2000) * 0.05
]
```

Approximation of velvet noise:

```
let iot = 20 / sampleRate();
let x = mouseX(1, 16, 1, 0.1);
let d = dustRange(iot / x, iot * x);
let s = tRand(-1, 1, d);
trig(d, sampleDur()) * s.sign * 0.1
```

Sine sweeps:

```
{
	let tr = dustRange(0.5, 1.25);
	let dur = tRand(0.01, 0.5, tr);
	let f0 = tRand(48, 60, tr);
	let f1 = tRand(36, 84, tr);
	let freq = tLine(f0, f1, dur, tr).midiCps;
	let env = decay2(tr, dur / 3, dur) * 0.5;
	sinOsc(freq, 0) * env
} !^ 7
```

* * *

See also: dust

Guides: Unit Generators

Categories: Ugen
