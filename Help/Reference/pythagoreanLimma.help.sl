# pythagoreanLimma

- _pythagoreanLimma(aNumber)_

The Pythagorean limma,
or Pythagorean diatonic semitone,
is the diatonic semitone in the Pythagorean tuning.

```
>>> 1.pythagoreanLimma
256/243

>>> 1.pythagoreanLimma.ratioToCents
90.225
```

It is the interval between five perfect just fourths (4/3) and two octaves (2/1):

```
>>> (4/3 ^ 5) / (2/1 ^ 2)
256/243
```

The Pythagorean chromatic semitone is wider:

```
>>> 1.pythagoreanChroma.ratioToCents
113.685
```

* * *

See also: mercatorsComma, octaveReduced, pythagoreanChroma, pythagoreanComma, septimalComma, syntonicComma

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/256/243)

Categories: Math, Contant, Tuning
