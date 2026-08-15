# AbsDif

- _AbsDif(α, β)_

Answer the absolute value of the difference of α and β.

```
>>> AbsDif(1, 2)
1
```

Written out:

```
>>> Abs(Subtract(1, 2))
1

>>> (1 - 2).abs
1
```

Simple rhythm:

```
let m = AbsDif(0.2, SinOsc(2, 0) * 0.5);
SinOsc(440, 0) * m / 2
```

* * *

See also: -, Abs, SqrDif

Categories: Math, Ugen
