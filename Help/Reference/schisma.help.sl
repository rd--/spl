# schisma

- _schisma(n)_

Answer the schisma comma raised to _n_.

The schisma is a small interval with the ratio 32805/32768.

```
>>> 1.schisma
32805/32768

>>> 1.schisma.ratioToCents
1.9537
```

Relations to simple intervals:

```
>>> (9/8 ^ 4) / 8/5
1.schisma

>>> 135/128 / 256/243
1.schisma

>>> (9/8 ^ 3) / 64/45
1.schisma
```

It has lattice coordinates _11 -4 -2_:

```
>>> 1.schisma.factorInteger
[2 -> -15, 3 -> 8, 5 -> 1]
```

* * *

See also: mercatorsComma, octaveReduced, pythagoreanChroma, pythagoreanComma, septimalComma, syntonicComma

Guides: Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Schisma)

Categories: Math, Contant, Tuning
