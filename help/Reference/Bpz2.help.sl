# Bpz2

- _Bpz2(in)_

Two zero fixed midpass.
A special case fixed filter.
Implements the formula:

> _out(i) = 0.5 * (in(i) - in(i-2))_

This filter cuts out 0 Hz and the Nyquist frequency, compare:

```
WhiteNoise() * 0.1
```

and:

```
Bpz2(WhiteNoise() * 0.1)
```

* * *

See also: Bpf

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/BPZ2.html)

Categories: Ugen
