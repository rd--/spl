# scheduleInjecting

- _scheduleInjecting(aClock, deltaTime, anObject, aBlock:/2)_
- _scheduleInjecting(deltaTime, anObject, aBlock:/2)_ ⇒ aClock = system.clock
- _scheduleInjecting(aBlock:/2, anObject)_ ⇒ deltaTime = 0

Schedule applying _aBlock_ to _anObject_ for _deltaTime_.
When evaluated the answer is a _[delay, nextValue]_ pair to continue, or _nil_ to halt.

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
		0.01, Rand(3, 7), 0.9
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

Categories: Scheduling
