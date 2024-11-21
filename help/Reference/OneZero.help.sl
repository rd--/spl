# OneZero

- _OneZero(in, coef)_

A one zero filter.

- in: input signal to be processed
- coef: feed forward coefficient.
  +0.5 makes a two point averaging filter (see also `Lpz1`),
  -0.5 makes a differentiator (see also `Hpz1`),
  +1 makes a single sample delay (see also `Delay1`),
  -1 makes an inverted single sample delay.

Implements the formula:

> _out(i) = ((1 - abs(coef)) * in(i)) + (coef * in(i-1))_

Low pass:

```
OneZero(WhiteNoise() * 0.2, 0.5)
```

High pass:

```
OneZero(WhiteNoise() * 0.2, -0.5)
```

Modulate coeficient:

```
OneZero(WhiteNoise() * 0.2, Line(-0.5, 0.5, 10))
```

* * *

See also: OnePole

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/OneZero.html)

Categories: Ugen
