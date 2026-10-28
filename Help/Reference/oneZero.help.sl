# oneZero

- _oneZero(in, coef=0.5)_

A one zero filter.

- in: input signal to be processed
- coef: feed forward coefficient

A _coef_ of +0.5 makes a two point averaging filter (see also `lpz1`),
of -0.5 makes a differentiator (see also `hpz1`),
of +1 makes a single sample delay (see also `delay1`),
and of -1 makes an inverted single sample delay.

Implements the formula:

> _y[n] = (1 - |α|) x[n] + α x[n-1]_

Low pass:

```
oneZero(whiteNoise() * 0.2, 0.5)
```

High pass:

```
oneZero(whiteNoise() * 0.2, -0.5)
```

Modulate coeficient:

```
oneZero(
	whiteNoise() * 0.2,
	line(-0.5, 0.5, 10)
)
```

* * *

See also: onePole, twoZero

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/OneZero.html)

Categories: Ugen
