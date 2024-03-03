# Integrator

- _Integrator(in, leak)_

Leaky integrator.
Integrates an input signal with a leak.

- in: input signal
- leak: leak coefficient.

The formula implemented is:

> _out(0) = in(0) + (leak * out(-1))_

As filter:

```
Integrator(LfPulse(300, 0, 0.2) * 0.1, 0.9)
```

Used as an envelope:

```
Integrator(LfPulse(3, 0, 0.2) * 0.0004, 0.999) * FSinOsc(700, 0)
```

* * *

See also: Slope

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Integrator.html)

Categories: Ugen, Math, Filter, Control
