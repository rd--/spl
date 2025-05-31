# Hpz1

- _Hpz1(in)_

Two point difference filter.
A special case fixed filter.
Implements the formula:

> _out(i) = 0.5 * (in(i) - in(i-1))_

Compare:

```
WhiteNoise() * 0.1
```

and:

```
Hpz1(WhiteNoise() * 0.25)
```

* * *

See also: Lpz1, Hpz2

References:
_Csound_
[1](http://csound.com/docs/manual/diff.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/HPZ1.html)

Categories: Ugen
