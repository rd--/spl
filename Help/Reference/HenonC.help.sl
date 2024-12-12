# HenonC

- _HenonC(freq=22050, a=1.4, b=0.3, x0=0, x1=0)_

Henon map chaotic generator.

- freq: iteration frequency in Hertz
- a, b: equation variables
- x0: initial value of x
- x1: second value of x

A cubic-interpolating sound generator based on the difference equation:

> _x(n+2) = 1 - a * xn + 12 + b * xn_

This equation was discovered by French astronomer Michel Henon while studying the orbits of stars in globular clusters.

Default initial params:

```
HenonC(
	MouseX(20, SampleRate(), 0, 0.2),
	1.4,
	0.3,
	0,
	0
) * 0.2
```

Mouse-control of parameters:

```
HenonC(
	SampleRate() / 4,
	MouseX(1, 1.4, 0, 0.2),
	MouseY(0, 0.3, 0, 0.2),
	0,
	0
) * 0.2
```

Randomly modulate parameters:

```
HenonC(
	SampleRate() / 8,
	LfNoise2(1) * 0.2 + 1.2,
	LfNoise2(1) * 0.15 + 0.15,
	0,
	0
) * 0.2
```

* * *

See also: HenonN, HenonL

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/HenonC.html)

Categories: Ugen, Noise, Chaos
