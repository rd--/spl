# Fos

- _Fos(in, a0, a1, b1)_

First order filter section.

A standard first order filter section. Filter coefficients are given directly rather than calculated for you. Formula is equivalent to _out(i) = (a0 * in(i)) + (a1 * in(i-1)) + (b1 * out(i-1))_.

Same as OnePole:

```
let x = MouseX(-1, 1, 0, 0.2);
Fos(LfSaw(200, 0) * 0.1, 1 - x.Abs, 0, x)
```

Same as OneZero:

```
let x = MouseX(-1, 1, 0, 0.2);
Fos(LfSaw(200, 0) * 0.1, 1 - x.Abs, x, 0)
```

* * *

See also: Sos

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/FOS.html)

Categories: Ugen

