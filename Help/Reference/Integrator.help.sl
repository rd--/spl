# Integrator

- _Integrator(in, coef=1)_

Leaky integrator.
Integrates an input signal with a leak.

- in: input signal
- leak: leak coefficient.

The formula implemented is:

> _y[n] = x[n] + (coef * x[n-1])_

As filter:

```
Integrator(
	LfPulse(300, 0, 0.2) * 0.1,
	0.9
)
```

Used as an envelope:

```
Integrator(
	LfPulse(3, 0, 0.2) * 0.0004,
	0.999
) * SinOsc(700, 0)
```

* * *

See also: Slope

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Integrator.html),
_W_
[1](https://en.wikipedia.org/wiki/Integrator)

Categories: Ugen, Math, Filter, Control
