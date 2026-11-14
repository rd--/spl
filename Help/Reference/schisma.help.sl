# schisma

- _schisma(n)_

Answer the schisma comma raised to _n_.

The schisma is a small interval with the ratio 32805/32768.

```
>>> 1L.schisma
32805/32768

>>> 1L.schisma
>>> .ratioToCents
1.9537
```

Relations to simple intervals:

```
>>> (9/8 ^ 4L) / 8/5
1L.schisma

>>> 135/128 / 256/243
1L.schisma

>>> (9/8 ^ 3L) / 64/45
1L.schisma
```

It has tuning lattice coordinates _-15 8 1_:

```
>>> 1L.schisma.factorInteger
[2 -15; 3 8; 5 1]
```

* * *

See also: mercatorsComma, octaveReduce, pythagoreanChroma, pythagoreanComma, septimalComma, syntonicComma

Guides: Tuning Functions, Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Schisma),
_Xenharmonic_
[1](https://en.xen.wiki/w/Schisma)
