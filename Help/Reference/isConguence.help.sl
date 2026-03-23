# isCongruence

- _isCongruence(b, c, m)_

Answer `true` if _b≡c(mod m)_, else `false`.

```
>>> (40 + 35).isCongruence(15, 60)
true

>>> (40 + 35) % 60 = 15
true

>>> (9 + 7).isCongruence(4, 12)
true

>>> (9 + 7) % 12 = 4
true
```

_c_ does not need to be given in least residue form:

```
>>> 38.isCongruence(14, 12)
true

>>> 14.isCongruence(38, 12)
true
```

The definition of congruence also applies to negative values:

```
>>> 2.isCongruence(-3, 5)
true

>>> -8.isCongruence(7, 5)
true

>>> -3.isCongruence(-8, 5)
true
```

* * *

See also: %, mod, Residue

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Congruence.html),
_W_
[1](https://en.wikipedia.org/wiki/Modular_arithmetic)
[2](https://en.wikipedia.org/wiki/Congruence_relation)
