# pythagoreanLimma

- _pythagoreanLimma(n)_

Answer the Pythagorean limma raised to _n_,
or Pythagorean diatonic semitone,
is the diatonic semitone in the Pythagorean tuning.

```
>>> 1.pythagoreanLimma
256/243

>>> 2.pythagoreanLimma
65536/59049
```

It factors as 2⁸/3⁵:

```
>>> 1.pythagoreanLimma.factorInteger
[2 8; 3 -5]
```

It is about 90.2 cents in size:

```
>>> 1.pythagoreanLimma
>>> .ratioToCents
90.225
```

Tenney, Weil and Wilson norms:

```
>>> 1.pythagoreanLimma.tenneyHeight
15.92481

>>> 1.pythagoreanLimma.weilHeight
16

>>> 1.pythagoreanLimma.wilsonHeight
31
```

It is the interval between five perfect just fourths (4/3) and two octaves (2/1):

```
>>> (4/3 ^ 5) / (2/1 ^ 2)
256/243

>>> (4/3 ^ 5).octaveReduce
256/243
```

Equivalently it is arrived at by decreasing 4/3 by two 9/8 major seconds:

```
>>> 4/3 / (9/8 ^ 2)
256/243
```

It is approximately halfway between the 5-limit semitone 16/15 and the minor half-tone 25/24:

```
>>> (25/24 + 16/15) / 2
253/240

>>> 253/240.ratioToCents
91.32

>>> 25/24.ratioToCents
70.67

>>> 16/15.ratioToCents
111.73

>>> (70.67 -- 111.73).midpoint
91.20
```

The Pythagorean chromatic semitone is wider:

```
>>> 1.pythagoreanChroma
>>> .ratioToCents
113.685
```

Continued fraction:

```
>>> 1.pythagoreanLimma
>>> .continuedFraction
[1 18 1 2 4]
```

* * *

See also: mercatorsComma, octaveReduce, pythagoreanChroma, pythagoreanComma, septimalComma, syntonicComma

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Pythagorean_limma),
_Xenharmonic_
[1](https://en.xen.wiki/w/256/243)
[2](https://en.xen.wiki/w/Diatonic_semitone)

Categories: Math, Contant, Tuning
