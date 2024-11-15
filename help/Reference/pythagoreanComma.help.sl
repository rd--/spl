# pythagoreanComma

- _pythagoreanComma(aNumber)_

Answer _aNumber_ times the Pythagorean comma.

The Pythagorean or ditonic comma is the interval with the ratio 531441/524288.

```
>>> 1.pythagoreanComma
531441/524288
```

It is approximated by the superparticular ratio 74/73:

```
>>> 1.pythagoreanComma
74/73
```

It is the amount by which twelve fifths exceed seven octaves.

```
>>> (3/2 ^ 12) / (2 ^ 7)
1.pythagoreanComma

>>> (3/2 ^ 12).octaveReduced
1.pythagoreanComma
```

It is also the ratio between the _apotome_ and the _Pythagorean limma_:

```
>>> 2187/2048 / 256/243
1.pythagoreanComma
```

It is also the ratio between the Pythagorean augmented fourth and diminished fifth:

```
>>> 729/512 / 1024/729
1.pythagoreanComma
```

It also equates six 9/8 major seconds with an octave:

```
>>> (9/8 ^ 6).octaveReduced
1.pythagoreanComma
```

It has lattice coordinates _-19 12_:

```
>>> 1.pythagoreanComma.factorInteger
[2 -> -19, 3 -> 12]
```

The twelfth part of the ditonic comma is very nearly two cents:

```
>>> 1.pythagoreanComma.ratioToCents / 12
1.955
```

and it is conventionally taken as 24 cents:

```
>>> 1.pythagoreanComma.ratioToCents.ceiling
24
```

* * *

See also: octaveReduced, septimalComma, syntonicComma

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Pythagorean_comma)

Categories: Math, Contant, Tuning
