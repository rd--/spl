# SqrDif -- math

Square of the difference.
_SqrDif(a, b)_ is _(a - b) ^ 2_.
This is more efficient than using separate unit generators for each operation.

```
SinOsc(800, 0).SqrDif(SinOsc(XLine(200, 500, 5), 0)) * 0.125
```

Written out:

```
let a = SinOsc(800, 0);
let b = SinOsc(XLine(200, 500, 5), 0);
let c = a - b;
(c * c) * 0.125
```

* * *

See also: AbsDif

