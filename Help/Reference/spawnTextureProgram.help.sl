# spawnTextureProgram

- _spawnTextureProgram(f/0, i/0)_

Answer a `TextureProgram` with an `identity` envelope block.
When played,
the process runs at the interval _i_ seconds.

Texture of overlapping sine tone dyads:

~~~spl texture
{
	{
		release(
			sinOsc(
				rand(220, 990),
				0
			),
			0.01,
			1,
			3
		)
	} ! 2 * 0.1
}.spawnTextureProgram {
	(0.5 -- 1.5).atRandom
}
~~~

* * *

See also: TextureProgram, collectTextureProgram, overlapTextureProgram, xFadeTextureProgram

Guides: SuperCollider Functions, Texture Programs

Categories: Scheduling
