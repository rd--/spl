# TextureProgram

- _TextureProgram(sound/{0,1}, envelope/1, delayTime/0)_

Answer a value that, when played,
schedules a periodic process on the system clock to evalute the no-argument block _sound_,
which should construct a `Ugen` graph,
and apply the block _envelope_ to the answer,
and send the result to the synthesiser.
The process runs at the interval _delayTime_.

In the program below the _sound_ generates a random sine tone,
the _envelope_ applies a `release` envelope,
and the _delayTime_ block selects a random integer to divide down:

~~~spl texture
{
	eqPan2(
		sinOsc(
			rand(111, 555),
			0
		) * rand(1, 5) / 100,
		rand(-1, 1)
	)
}.TextureProgram { :x |
	release(x, 1, 3, 1)
} {
	3:7.atRandom / 9
}
~~~

* * *

See also: collectTextureProgram, overlapTextureProgram, spawnTextureProgram, xFadeTextureProgram

Guides: SuperCollider Functions, Texture Programs, Unit Generators

Categories: Scheduling
