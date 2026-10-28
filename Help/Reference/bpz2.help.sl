# bpz2

- _bpz2(in)_

Two zero fixed midpass.
A special case fixed filter.
Implements the formula:

> _out(i) = 0.5 * (in(i) - in(i-2))_

This filter cuts out 0 Hz and the Nyquist frequency, compare:

```
whiteNoise() * 0.1
```

and:

```
bpz2(whiteNoise() * 0.1)
```

* * *

See also: bpf

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/BPZ2.html)

Categories: Ugen, Filter
