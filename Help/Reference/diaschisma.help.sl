# diaschisma

- _diaschisma(n)_

Answer the diaschisma comma raised to _n_.

The diaschisma is the interval with the ratio 2048/2025.

```
>>> 1.diaschisma
2048/2025

>>> 1.diaschisma.ratioToCents
19.553
```

It is the size of a pythagorean comma minus two schismas:

```
>>> 1.pythagoreanComma / 2.schisma
1.diaschisma
```

Relations to simple intervals:

```
>>> (2 ^ 3) / ((3/2 ^ 4) * (5/4 ^ 2))
1.diaschisma

>>> 16/9 / 225/128
1.diaschisma

>>> (16/15 ^ 2) / 9/8
1.diaschisma
```

It has lattice coordinates _11 -4 -2_:

```
>>> 1.diaschisma.factorInteger
[2 -> 11, 3 -> -4, 5 -> -2]
```

* * *

See also: mercatorsComma, octaveReduce, pythagoreanChroma, pythagoreanComma, septimalComma, syntonicComma

Guides: Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Diaschisma)

Categories: Math, Contant, Tuning
