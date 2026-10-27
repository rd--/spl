# sum4

- _sum4(a, b, c, d)_

Sum four signals.
A primitive unit-generator to efficiently sum four signals.
Should not be used directly, instead see `Mix` and `Sum`.

```
let o = SinOsc([111, 333, 555, 777], 0);
let [a, b, c, d] = o * 0.1;
sum4(a, b, c, d)
```

_Note:_
sum4 requires all inputs be operating at the same rate, and will crash the synthesiser otherwise.

* * *

See also: Mix, Sum, sum

Guides: Unit Generators

Categories: Ugen
