# Diwhite

- _Diwhite(length=inf, lo=0, hi=1)_

Demand rate white noise random generator.
Diwhite returns integers in the continuous range between lo and hi.

- length: Number of values to create
- lo: Minimum value
- hi: Maximum value

As frequency control:

```
let a = Diwhite(inf, 0, [13 15]);
let t = Impulse(MouseX(1, 40, 1, 0.2), 0);
let f = Demand(t, 0, a) * 30 + 340;
SinOsc(f, 0) * 0.1
```

* * *

See also: Dwhite, WhiteNoise
