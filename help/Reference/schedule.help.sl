# schedule

- _schedule(aClock, deltaTime, aBlock:/1)_
- _schedule(deltaTime, aBlock:/1)_ ⇒ _aClock = system.clock_
- _schedule(aBlock:/1)_ ⇒ _deltaTime = 0_

Schedule _aBlock_ for _deltaTime_ (in seconds) at _aClock_.
When _aBlock_ is evaluated,
with the current logical time as parameter,
the answer is either an interval at which to re-schedule,
or `nil` to halt.

The expression below schedules random sine tones of random durations at random intervals:

```
{ :currentTime |
	Release(
		Pan2(
			SinOsc(IRand(48, 72).MidiCps, 0),
			Rand(-1, 1),
			Rand(0, 0.1)
		),
		Rand(0, 1),
		Rand(1, 2),
		Rand(2, 3)
	).playAt(currentTime);
	(1 -- 1.5).atRandom
}.schedule
```

* * *

See also: repeatEvery, scheduleInjecting, Clock

Category: Scheduling
