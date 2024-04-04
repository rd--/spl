# spawn

- _spawn(aBlock, nextTime)_

Schedules a periodic process on the system clock to evalute _aBlock()_, which should construct a Ugen graph.

The process runs at the interval _nextTime_, which is sent the _value_ message at each recurrence.

Texture of overlapping sine tones:

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
}.spawn(3 / 2)
```

* * *

See also: overlap

Categories: Texture generator
