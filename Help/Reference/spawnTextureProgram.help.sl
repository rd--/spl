# spawnTextureProgram

- _spawnTextureProgram(aBlock, nextTime)_

Answer a `TextureProgram` with an `identity` envelope block.
When played,
the process runs at the interval _nextTime_,
which is sent the `value` message at each recurrence.

Texture of overlapping sine tone dyads:

```
{
	{
		Release(
			SinOsc(
				Rand(220, 990),
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
```

* * *

See also: collectTextureProgram, overlapTextureProgram, TextureProgram, xFadeTextureProgram

Categories: Scheduling
