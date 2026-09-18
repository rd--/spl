# playEvery

- _playEvery(c=system.clock, f/1, i)_

Schedule sound generating block at intervals.
Evaluate the block _f_ now, and re-schedule recursively after interval _i_ seconds.
_f_ receives one argument, the delay time until it will next be invoked.

In the two-argument form scheduling is on the `system` clock.

In the example below the next delay time is used to calculate the duration of the current sound,
so that is does not overlap by very much with the next sound:

~~~spl scheduler
{ :nextDelay |
	let attack = (0 -- 1).atRandom;
	let decay = (2 -- 3).atRandom;
	let transition = attack + decay;
	let sustain = nextDelay - transition + 0.5;
	Release(
		Pan2(
			SinOsc(
				IRand(48, 72).MidiCps,
				0
			),
			Rand(-1, 1),
			Rand(0, 0.1)
		),
		attack,
		sustain.max(0),
		decay
	)
}.playEvery {
	(1 -- 3.5).atRandom.seconds
}
~~~

* * *

See also: Clock, playAt, schedule

Categories: Scheduling
