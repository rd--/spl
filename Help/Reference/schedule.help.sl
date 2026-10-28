# schedule

- _schedule(f/1, n=0, c=system.clock)_

Schedule the block _f_ to run in _n_ seconds on the clock _c_.
When _f_ is evaluated,
with the current logical time as parameter,
the answer is either an interval at which to re-schedule,
or `nil` to halt.

The expression below schedules random sine tones of random durations at random intervals:

~~~spl scheduler
{ :currentTime |
	release(
		pan2(
			sinOsc(
				iRand(48, 72).midiCps,
				0
			),
			rand(-1, 1),
			rand(0, 0.1)
		),
		rand(0, 1),
		rand(1, 2),
		rand(2, 3)
	).playAt(currentTime);
	(1 -- 1.5).atRandom
}.schedule
~~~

* * *

See also: Clock, repeatEvery, scheduleInjecting

Guides: Scheduling Functions

Categories: Scheduling
