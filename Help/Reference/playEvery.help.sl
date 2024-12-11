# playEvery

- _playEvery(aClock, aBlock:/1, interval)_
- _playEvery(aBlock:/1, interval)_ ⟹ aClock=system.clock

Schedule sound generating block at intervals.
Evaluate _aBlock.play_ now, and re-schedule recursively after _interval.value_ seconds.
_aBlock_ receives one argument, the delay time until it will next be invoked.

In the two-argument form scheduling is on _system.clock_.

In the example below the next delay time is used to calculate the duration of the current sound,
so that is does not overlap by very much with the next sound:

```
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
	(1 -- 3.5).atRandom
}
```

* * *

See also: Clock, playAt, schedule

Categories: Scheduling
