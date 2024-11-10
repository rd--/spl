# AbsDif

- _AbsDif(α, β)_ ⟹ _Abs(Sub(α, β))_

Answer the absolute value of the difference.

```
>>> AbsDif(1, 2)
1
```

Written out:

```
>>> Abs(Sub(1, 2))
1
```

Simple rhythm:

```
SinOsc(440, 0) * AbsDif(0.2, SinOsc(2, 0) * 0.5) / 2
```

* * *

See also: -, Abs, SqrDif

Categories: Math, Ugen
