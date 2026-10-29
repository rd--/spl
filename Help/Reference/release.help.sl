# release

- _release(in, attackTime=1, sustainTime=1, releaseTime=1)_

Envelope generator.
Apply a three stage envelope to _in_ and release the synthesis node once the envelope is ended.

With counter to check timing:

~~~spl syn=A
let counter = pinkNoise() * decay(
	impulse(1, 0),
	0.1
) * 0.1;
release(
	sinOsc(440, 0) * 0.1,
	3,
	2,
	5
) + counter
~~~

Short attack time:

~~~spl syn=B
release(sinOsc(440, 0) * 0.1, 0.01, 3, 7)
~~~

At `Record`:

~~~spl syn=C
(
	in: sinOsc(440, 0) * 0.1,
	attackTime: 0.01,
	sustainTime: 3,
	releaseTime: 7
).release
~~~

Scheduling process:

~~~spl scheduler
let t = system.sessionTime;
0:9.do { :x |
	release(
		pan2(
			sinOsc(rand(200, 400), 0),
			rand(-1, 1),
			rand(0.01, 0.1)
		),
		0.01, 3, 7
	).playAt(t + x)
}
~~~

* * *

See also: asr, cutoff

Guides: Unit Generators

Categories: Ugen
