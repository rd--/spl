# hpz2

- _hpz2(in)_

Two zero fixed highpass.
A special case fixed filter.
Implements the formula:

> _out(i) = 0.25 * (in(i) - (2*in(i-1)) + in(i-2))_

Compare:

```
whiteNoise() * 0.1
```

and:

```
hpz2(whiteNoise()) * 0.1
```

* * *

See also: bpz2, brz2, hpz1, lpz2

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/HPZ2.html)

Categories: Ugen
