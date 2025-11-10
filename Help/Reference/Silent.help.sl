# Silent

- _Silent(numChannels)_

Output zero (silence).
Equivalent to a list of _Dc(0)_ values.

Offset eight random sine tones by eight silent channels,
requires sixteen channel system to hear:

```
Silent(8) ++ (
	{
		SinOsc(
			Rand(200, 2000),
			0
		) * 0.1
	} ! 8
)
```

* * *

See also: Dc

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Silent.html)

Categories: Ugen
