# scheduleInjecting -- scheduling

- _scheduleInjecting(aClock, deltaTime, aValue, aBlock:/2)_
- _scheduleInjecting(deltaTime, aValue, aBlock:/2)_ ⇒ aClock = system.clock
- _scheduleInjecting(aBlock:/2, aValue)_ ⇒ deltaTime = 0

Schedule applying _aBlock_ to _aValue_ for _deltaTime_.
When evaluated the answer is a _[delay, nextValue]_ pair to continue, or _nil_ to halt.

Play ascending chromatic scale from C2 to C5,
with random inter-offset delays, durations and pan locations:

```
{ :currentTime :midiNoteNumber |
	['Midi', midiNoteNumber].postLine;
	{
		Release(
			EqPan(
				SinOsc(midiNoteNumber.MidiCps, 0) * 0.1,
				Rand(-1, 1)
			),
			0.01, Rand(3, 7), 0.9
		)
	}.play;
	(midiNoteNumber <= 72).ifTrue {
		[
			[1 / 3, 1 / 2, 1, 3 / 2, 5].atRandom,
			midiNoteNumber + 1
		]
	}
}.scheduleInjecting(36)
```
