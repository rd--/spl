# pythagoreanChroma

- _pythagoreanChroma(n)_

The Pythagorean chroma,
or apotome,
or Pythagorean chromatic semitone,
is the chromatic semitone in the Pythagorean tuning.

```
>>> 1.pythagoreanChroma
2187/2048
```

It measures about 113.7¢:

```
>>> 1.pythagoreanChroma
>>> .ratioToCents
113.685
```

It is the 3-limit interval between seven perfect just fifths (3/2) and four octaves (2/1):

```
>>> (3/2 ^ 7) / (2 ^ 4)
2187/2048

>>> (3/2 ^ 7).octaveReduce
2187/2048
```

It measures about 113.7¢:

```
>>> 1.pythagoreanChroma
>>> .ratioToCents
113.685
```

The Pythagorean minor second is narrower:

```
>>> 1.pythagoreanLimma
>>> .ratioToCents
90.225
```

Tenney, Weil and Wilson norms:

```
>>> 1.pythagoreanChroma.tenneyHeight
22.0947

>>> 1.pythagoreanChroma.weilHeight
22.1894

>>> 1.pythagoreanChroma.wilsonHeight
43
```

* * *

See also: mercatorsComma, octaveReduce, pythagoreanComma, pythagoreanLimma, septimalComma, syntonicComma

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Pythagorean_apotome),
_Xenharmonic_
[1](https://en.xen.wiki/w/2187/2048)
[2](https://en.xen.wiki/w/Chromatic_semitone)

Categories: Math, Contant, Tuning
