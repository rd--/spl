# diesis

- _diesis(n)_

Answer the diesis raised to _n_.

The diesis is a small interval with the ratio 128/125.

```
>>> 1L.diesis
128/125

>>> 1L.diesis.ratioToCents
41.059
```

Relations to simple intervals:

```
>>> 2L / (5/4 ^ 3L)
1L.diesis
```

It has tuning lattice coordinates _7 0 -3_:

```
>>> 1L.diesis.factorInteger
[2 7; 5 -3]
```

* * *

See also: mercatorsComma, octaveReduce, pythagoreanChroma, pythagoreanComma, septimalComma, syntonicComma

Guides: Tuning Functions, Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Diesis)
