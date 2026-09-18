# TextureProgram

- _TextureProgram(sound/{0,1}, envelope/1, delayTime)_

Answer a value that, when played,
schedules a periodic process on the system clock to evalute the no-argument block _sound_,
which should construct a `Ugen` graph,
and apply the block _envelope_ to the answer,
and send the result to the synthesiser.
The process runs at the interval _delayTime_.

In the program below the _sound_ generates a random sine tone,
the _envelope_ applies a `Release` envelope,
and the _delayTime_ block selects a random integer to divide down:

~~~spl texture
{
	EqPan2(
		SinOsc(
			Rand(111, 555),
			0
		) * Rand(1, 5) / 100,
		Rand(-1, 1)
	)
}.TextureProgram { :x |
	Release(x, 1, 3, 1)
} {
	3:7.atRandom / 9
}
~~~

* * *

See also: collectTextureProgram, OverlapTexture, overlapTextureProgram, spawnTextureProgram, xFadeTextureProgram

Guides: Unit Generators

Categories: Scheduling
