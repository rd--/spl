# silent

- _silent(numChannels)_

Output zero (silence).
Equivalent to a list of _dc(0)_ values.

Offset eight random sine tones by eight silent channels,
requires sixteen channel system to hear:

```
silent(8) ++ (
	{
		sinOsc(
			rand(200, 2000),
			0
		) * 0.1
	} ! 8
)
```

* * *

See also: dc

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Silent.html)

Categories: Ugen
