# collectTextureProgram

- _collectTextureProgram(c, f:/1, d)_

Answer a `TextureProgram` that will
evaluate the block _f_ at each element of the collection _c_ with delay _d_ seconds between each occurence,
and _play_ each answer.

Play ascending diatonic scale:

~~~spl texture
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
~~~

* * *

See also: overlapTextureProgram, spawnTextureProgram, TextureProgram, xFadeTextureProgram

Guides: Texture Programs

Categories: Scheduling
