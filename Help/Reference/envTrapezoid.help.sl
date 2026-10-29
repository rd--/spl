# envTrapezoid

- _envTrapezoid(trig=0, dur=1, shape=0, skew=0.5)_

Default parameters:

~~~spl syn=A
let tr = impulse(1, 0);
let env = envTrapezoid(tr, 0.5, 0, 0.5);
sinOsc(440, 0) * env * 0.1
~~~

Randomised parameters:

~~~spl syn=B
let tr = impulse(4, 0);
let env = envTrapezoid(
	tr,
	tRand(0.02, 0.20, tr),
	tRand(0.25, 0.75, tr),
	tRand(0.1, 0.9, tr)
);
sinOsc(440, 0) * env * 0.1
~~~

Parallel streams:

~~~spl syn=C
let tr = dustRange(
	0.005,
	sinOsc(1 / 11, 0).linLin(-1, 1, 0.005, 0.125)
);
let dur = tRand(
	0.05,
	sinOsc(1 / 13, 1.pi).linLin(-1, 1, 0.05, 0.125),
	tr
);
let w = trigAllocator(256, 1, tr, dur);
let shape = mouseX(0.25, 0.75, 0, 0.2);
let skew = mouseY(0.25, 0.75, 0, 0.2);
let env = envTrapezoid(
	w,
	dur,
	tRand(shape - 0.1, shape + 0.1, w),
	tRand(skew - 0.1, skew + 0.1, w)
);
let osc = blip(
	tRand(
		333,
		sinOsc(1 / 17, 1.pi).linLin(
			-1, 1,
			333, 555
		),
		w
	),
	tRand(
		1,
		sinOsc(1 / 23, 1.pi).linLin(
			-1, 1,
			1, 4
		),
		w
	)
) * env / 2;
osc.splay
~~~

* * *

See also: Env, envGen

Guides: Unit Generators

Categories: Ugen, Envelope
