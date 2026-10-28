# collectTextureProgram

- _collectTextureProgram(c, f/1, d/0)_

Answer a `TextureProgram` that will
evaluate the block _f_ at each element of the collection _c_,
with delay _d_ seconds between each occurence,
and _play_ each answer.

Play slowly ascending diatonic scale:

~~~spl texture
[0 2 4 5 7 9 11 12]
.collectTextureProgram { :pitchClass |
	release(
		eqPan2(
			sinOsc(
				midiCps(pitchClass + 48),
				0
			) * 0.1,
			rand(-1, 1)
		),
		3, 4, 3
	)
} {
	[1 3 5 7].atRandom
}
~~~

* * *

See also: TextureProgram, overlapTextureProgram, spawnTextureProgram, xFadeTextureProgram

Guides: SuperCollider Functions, Texture Programs

Categories: Scheduling
