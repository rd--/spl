# OnePole

- _OnePole(in, coef)_

A one pole filter.

- in: input signal to be processed
- coef: feedback coefficient. Should be between -1 and +1

Implements the formula:

> _out(i) = ((1 - abs(coef)) * in(i)) + (coef * out(i-1))_.

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
OnePole(WhiteNoise() * 0.2, Line(0.95, -0.95, 10))
```

* * *

See also: OneZero

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/OnePole.html)

Categories: Ugen
