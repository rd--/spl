# EnvTrapezoid

_EnvTrapezoid(trig=0, dur=1, shape=0, skew=0.5)_

Default parameters:

	var tr = Impulse(1, 0);
	var env = EnvTrapezoid(tr, 0.5, 0, 0.5);
	SinOsc(440, 0) * env * 0.1

Randomised parameters:

	var tr = Impulse(4, 0);
	var env = EnvTrapezoid(
		tr,
		TRand(0.02, 0.20, tr),
		TRand(0.25, 0.75, tr),
		TRand(0.1, 0.9, tr)
	);
	SinOsc(440, 0) * env * 0.1

Parallel streams:

	var tr = DustRange(
		0.005,
		SinOsc(1 / 11, 0).LinLin(-1, 1, 0.005, 0.125)
	);
	var dur = TRand(
		0.05,
		SinOsc(1 / 13, pi).LinLin(-1, 1, 0.05, 0.125),
		tr
	);
	var w = TrigAllocator(256, 1, tr, dur);
	var shape = MouseX(0.25, 0.75, 0, 0.2);
	var skew = MouseY(0.25, 0.75, 0, 0.2);
	var env = EnvTrapezoid(
		w,
		dur,
		TRand(shape - 0.1, shape + 0.1, w),
		TRand(skew - 0.1, skew + 0.1, w)
	);
	var osc = Blip(
		TRand(
			333,
			SinOsc(1 / 17, pi).LinLin(-1, 1, 333, 555),
			w
		),
		TRand(
			1,
			SinOsc(1 / 23, pi).LinLin(-1, 1, 1, 4),
			w
		)
	) * env / 2;
	osc.Splay

* * *

See also: Env, EnvGen
