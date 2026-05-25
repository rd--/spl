# septimalComma

- _septimalComma(n)_

Answer the septimal comma raised to the number _n_.

The septimal comma is the interval with the square superparticular ratio 64/63.

```
>>> 1.septimalComma
64/63
```

It has the size of approximately 27.3¢:

```
>>> 1.septimalComma
>>> .ratioToCents
27.264

>>> 1.septimalComma
>>> .ratioToSavarts
6.839
```

It is the difference between the two superparticular ratios 8/7 and 9/8:

```
>>> 8/7 / 9/8
1.septimalComma
```

and between 81/16 and 5/1:

```
>>> 16/9 / 7/4
1.septimalComma
```

It has tuning lattice coordinates _6 -2 0 -1_:

```
>>> 1.septimalComma
>>> .factorInteger
[2 6; 3 -2; 7 -1]

>>> 1.septimalComma
>>> .primeExponents
[6 -2 0 -1]
```

* * *

See also: pythagoreanComma, syntonicComma

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Septimal_comma),
_Xenharmonic_
[1](https://en.xen.wiki/w/64/63)

Categories: Math, Contant, Tuning
