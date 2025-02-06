# mercatorsComma

- _mercatorsComma(aNumber)_

Answer Mercators comma raised to _aNumber_.

Mercators comma, or the 53-comma, is a small comma of 3.615 cents.
It is the amount by which 53 perfect fifths exceed 31 octaves.

```
>>> 1.mercatorsComma
Fraction(3L ^ 53, 2L ^ 84)

>>> 1.mercatorsComma
(3 ^ 53) / (2 ^ 84)

>>> 1.mercatorsComma
1.0021

>>> 1.mercatorsComma.ratioToCents
3.615
```

It is also the amount by which a stack of four Pythagorean commas exceeds a Pythagorean limma

```
>>> (
>>> 	4L.pythagoreanComma
>>> 	/
>>> 	1.pythagoreanLimma
>>> )
1.mercatorsComma
```

It is also the amount by which a stack of eight apotomes exceeds a 27/16 major sixth:

```
>>> 8L.pythagoreanChroma / 27/16
1.mercatorsComma
```

* * *

See also: holdersComma, pythagoreanComma, septimalComma, syntonicComma

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Mercator%27s_comma)

Categories: Math, Contant, Tuning
