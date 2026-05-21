# pythagoreanComma

- _pythagoreanComma(n)_

Answer the Pythagorean comma raised to _n_.

The Pythagorean, or ditonic, comma is the interval with the ratio 531441/524288.

```
>>> 1.pythagoreanComma
531441/524288
```

It measures about 23.5¢:

```
>>> 1.pythagoreanComma
>>> .ratioToCents
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

It has tuning lattice coordinates _-19 12_:

```
>>> 1.pythagoreanComma.factorInteger
[2 -19; 3 12]
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

Decimal expansion of the Pythagorean comma,
OEIS [A221363](https://oeis.org/A221363):

```
>>> Decimal(1.pythagoreanComma, 19)
>>> .decimalExpansion
[1 0 1 3 6 4 3 2 6 4 7 7 0 5 0 7 8 1 2 5]
```

Continued fraction of the Pythagorean comma,

```
>>> 1.pythagoreanComma
>>> .continuedFraction
[1 73 3 2 1 1 1 23 2 5]
```

Tenney, Weil and Wilson norms:

```
>>> 1.pythagoreanComma.tenneyHeight
38.0196

>>> 1.pythagoreanComma.weilHeight
38.0391

>>> 1.pythagoreanComma.wilsonHeight
74
```

* * *

See also: mercatorsComma, octaveReduce, pythagoreanChroma, septimalComma, syntonicComma

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Pythagorean_comma)
[2](https://en.wikipedia.org/wiki/Comma_(music)),
_Xenharmonic_
[1](https://en.xen.wiki/w/Pythagorean_comma)

Categories: Math, Contant, Tuning
