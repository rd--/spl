# collectTextureProgram

- _collectTextureProgram(aCollection, aBlock:/1, aDelay)_

Answer a `TextureProgram` that will
evaluate _aBlock_ at each element of _aCollection_ with _aDelay.value_ seconds between each occurence, and _play_ each answer.

Play ascending diatonic scale:

```
[0 2 4 5 7 9 11 12]
.collectTextureProgram { :pitchClass |
	Release(
		EqPan2(
			SinOsc(
				MidiCps(pitchClass + 48),
				0
			) * 0.1,
			Rand(-1, 1)
		),
		3, 4, 3
	)
} {
	[1 3 5 7].atRandom
}
```

* * *

See also: overlapTextureProgram, spawnTextureProgram, TextureProgram, xFadeTextureProgram

Guides: Texture Programs

Categories: Scheduling
