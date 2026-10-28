# brz2

- _brz2(in)_

Two zero fixed midcut.
A special case fixed filter.
Implements the formula:

> _out(i) = 0.5 * (in(i) + in(i-2))_

This filter cuts out frequencies around 1/2 of the Nyquist frequency, compare:

```
whiteNoise() * 0.1
```

and:

```
brz2(whiteNoise() * 0.1)
```

* * *

See also: bpz2, brf

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/BRZ2.html)

Categories: Ugen, Filter
