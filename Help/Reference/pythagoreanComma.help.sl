# pythagoreanComma

- _pythagoreanComma(n)_

Answer the Pythagorean comma raised to _n_.

The Pythagorean, or ditonic, comma is the interval with the ratio 531441/524288.

```
>>> 1.pythagoreanComma
531441/524288

>>> 1.pythagoreanComma.ratioToCents
23.46
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

>>> (3/2 ^ 12).octaveReduce
1.pythagoreanComma
```

It is also the ratio between the `pythagoreanChroma` and the `pythagoreanLimma`:

```
>>> (
>>> 	1.pythagoreanChroma
>>> 	/
>>> 	1.pythagoreanLimma
>>> )
1.pythagoreanComma

>>> 2187/2048 / 256/243
531441/524288
```

It is also the ratio between the Pythagorean augmented fourth and diminished fifth:

```
>>> 729/512 / 1024/729
1.pythagoreanComma
```

It also equates six 9/8 major seconds with an octave:

```
>>> (9/8 ^ 6).octaveReduce
1.pythagoreanComma
```

It has lattice coordinates _-19 12_:

```
>>> 1.pythagoreanComma.factorInteger
[2 -> -19, 3 -> 12]
```

The twelfth part of the ditonic comma is very nearly two cents:

```
>>> let c = 1.pythagoreanComma;
>>> c.ratioToCents / 12
1.955
```

and it is conventionally taken as 24 cents:

```
>>> 1.pythagoreanComma
>>> .ratioToCents
>>> .ceiling
24
```

* * *

See also: mercatorsComma, octaveReduce, pythagoreanChroma, septimalComma, syntonicComma

Guides: Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Pythagorean_comma)

Categories: Math, Contant, Tuning
