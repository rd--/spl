# schedule

- _schedule(c, n, f:/1)_

Schedule the block _f_ to run in _n_ seconds on the clock _c_.
When _f_ is evaluated,
with the current logical time as parameter,
the answer is either an interval at which to re-schedule,
or `nil` to halt.

The expression below schedules random sine tones of random durations at random intervals:

~~~spl scheduler
{ :currentTime |
	Release(
		Pan2(
			SinOsc(
				IRand(48, 72).MidiCps,
				0
			),
			Rand(-1, 1),
			Rand(0, 0.1)
		),
		Rand(0, 1),
		Rand(1, 2),
		Rand(2, 3)
	).playAt(currentTime);
	(1 -- 1.5).atRandom
}.schedule
~~~

* * *

See also: repeatEvery, scheduleInjecting, Clock

Guides: Scheduling Functions

Categories: Scheduling
