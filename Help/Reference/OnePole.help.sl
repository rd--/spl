# OnePole

- _OnePole(in, coef=0.5)_

A one pole filter.

- in: input signal to be processed
- coef: feedback coefficient. Should be between -1 and +1

Implements the formula:

> _y[n] = (1 - |α|) x[n] + α x[n-1]_

Low pass:

```
OnePole(WhiteNoise() * 0.2, 0.95)
```

High pass:

```
OnePole(WhiteNoise() * 0.2, -0.95)
```

Modulate coeficient:

```
OnePole(
	WhiteNoise() * 0.2,
	Line(0.95, -0.95, 10)
)
```

* * *

See also: OneZero, TwoPole

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/OnePole.html)

Categories: Ugen
