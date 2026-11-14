# diaschisma

- _diaschisma(n)_

Answer the diaschisma comma raised to _n_.

The diaschisma is the interval with the ratio 2048/2025.

```
>>> 1L.diaschisma
2048/2025

>>> 1L.diaschisma.ratioToCents
19.553
```

It is the size of a pythagorean comma minus two schismas:

```
>>> 1L.pythagoreanComma / 2L.schisma
1L.diaschisma
```

Relations to simple intervals:

```
>>> (2L ^ 3L) / ((3/2 ^ 4L) * (5/4 ^ 2L))
1L.diaschisma

>>> 16/9 / 225/128
1L.diaschisma

>>> (16/15 ^ 2L) / 9/8
1L.diaschisma
```

It has tuning lattice coordinates _11 -4 -2_:

```
>>> 1L.diaschisma.factorInteger
[2 11; 3 -4; 5 -2]
```

* * *

See also: mercatorsComma, octaveReduce, pythagoreanChroma, pythagoreanComma, septimalComma, syntonicComma

Guides: Tuning Functions, Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Diaschisma),
_Xenharmonic_
[1](https://en.xen.wiki/w/Diaschisma)
