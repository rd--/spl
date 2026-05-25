# mercatorsComma

- _mercatorsComma(n)_

Answer Mercators comma raised to the number _n_.

Mercators comma, or the 53-comma, is a small comma of 3.615 cents.
It is the amount by which 53 perfect fifths exceed 31 octaves.

```
>>> 1.mercatorsComma
19383245667680019896796723L
/
19342813113834066795298816L

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

Guides: Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Mercator%27s_comma)

Categories: Math, Contant, Tuning
