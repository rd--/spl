# Release

- _Release(in, attackTime=1, sustainTime=1, releaseTime=1)_

Envelope generator.
Apply a three stage envelope to _in_ and release the synthesis node once the envelope is ended.

With counter to check timing:

```
let counter = PinkNoise() * Decay(
	Impulse(1, 0),
	0.1
) * 0.1;
Release(
	SinOsc(440, 0) * 0.1,
	3,
	2,
	5
) + counter
```

Short attack time:

```
Release(SinOsc(440, 0) * 0.1, 0.01, 3, 7)
```

At `Record`:

```
Release(
	in: SinOsc(440, 0) * 0.1,
	attackTime: 0.01,
	sustainTime: 3,
	releaseTime: 7
)
```

Scheduling process:

~~~spl scheduler
let t = system.sessionTime;
0:9.do { :x |
	Release(
		Pan2(
			SinOsc(Rand(200, 400), 0),
			Rand(-1, 1),
			Rand(0.01, 0.1)
		),
		0.01, 3, 7
	).playAt(t + x)
}
~~~

* * *

See also: Asr, Cutoff

Categories: Ugen
