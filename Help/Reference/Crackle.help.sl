# Crackle

- _Crackle(chaosParameter=1.5)_

Chaotic noise function.
A noise generator based on a chaotic function.

- chaosParameter: useful values are from just below 1 to just above 2, towards 2 the sound crackles.

Fixed chaos parameter:

```
Crackle(1.95) * 0.1
```

Modulate chaos parameter:

```
Crackle(
	Line(1, 2, 10)
) * 0.1
```

Mouse control of chaos parameter:

```
Crackle(
	[
		MouseX(1, 2, 0, 0.2),
		MouseY(1, 2, 0, 0.2)
	]
) * 0.1
```

* * *

See also: LatoocarfianN, Logistic

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Crackle.html)

Categories: Ugen, Noise
