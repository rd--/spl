# scheduleInjecting

- _scheduleInjecting(f:/2, x, n, c)_

Schedule applying the block _f_ to the object _x_ in _n_ seconds on clock _c_.
When evaluated the answer is either a _(delay,nextValue)_ pair to continue,
or `nil` to halt.

Play ascending chromatic scale from C2 to C5,
with random inter-offset delays, durations and pan locations:

~~~spl scheduler
{ :currentTime :midiNoteNumber |
	let n = midiNoteNumber;
	Release(
		EqPan(
			SinOsc(
				n.MidiCps,
				0
			) * 0.1,
			Rand(-1, 1)
		),
		0.01,
		Rand(3, 7),
		0.9
	).playAt(currentTime);
	(n <= 72).ifTrue {
		[
			[
				1 / 3,
				1 / 2,
				1,
				3 / 2,
				5
			].atRandom,
			n + 1
		]
	}
}.scheduleInjecting(36)
~~~

* * *

See also: recurseEvery, repeatEvery, schedule

Guides: Scheduling Functions

Categories: Scheduling
