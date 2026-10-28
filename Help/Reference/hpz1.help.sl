# hpz1

- _hpz1(in)_

Two point difference filter.
A special case fixed filter.
Implements the formula:

> _out(i) = 0.5 * (in(i) - in(i-1))_

Compare:

```
whiteNoise() * 0.1
```

and:

```
hpz1(whiteNoise() * 0.25)
```

* * *

See also: hpz2, lpz1

Guides: Unit Generators

References:
_Csound_
[1](http://csound.com/docs/manual/diff.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/HPZ1.html)

Categories: Ugen
