# syntonicComma

- _syntonicComma(n)_

Answer the syntonic comma,
also known as the Didymus’ comma or the meantone comma or the Ptolemaic comma,
raised to the number _n_.

The syntonic comma comma is the interval with the superparticular ratio 81/80.

```
>>> 1L.syntonicComma
81/80

>>> 1L.syntonicComma
>>> .isSuperparticular
true
```

It has size of approximately 21.5¢:

```
>>> 1L.syntonicComma
>>> .ratioToCents
21.506

>>> 1L.syntonicComma
>>> .ratioToSavarts
5.395
```

which is close to one step of 55-EDO:

```
>>> 2.nthRoot(55)
>>> .ratioToCents
21.818
```

It is the difference between the two superparticular ratios 10/9 and 9/8:

```
>>> 9/8 / 10/9
1L.syntonicComma
```

and between 81/16 and 5/1:

```
>>> 3/2 ^ 4L / 5L
1L.syntonicComma
```

or more usually between 81/64 and 5/4, the 3- and 5- limit major thirds
(the just major third and the Pythagorean ditone):

```
>>> 81/64 / 5/4
1L.syntonicComma
```

It has tuning lattice coordinates _-4 4 -1_:

```
>>> 1L.syntonicComma
>>> .factorInteger
[2 -4; 3 4; 5 -1]

>>> 1L.syntonicComma
>>> .primeExponents
[-4 4 -1]
```

It is the distance between the Ptolemaic and Pythagorean chromatic semitones:

```
>>> (135/128 * 1L.syntonicComma)
1L.pythagoreanChroma
```

The schisma, 32805/32768, is the difference between the Pythagorean comma and the syntonic comma:

```
>>> 1L.pythagoreanComma
>>> /
>>> 1L.syntonicComma
32805/32768
```

The schisma also is the difference between eight perfect fifths plus a major third and five octaves;

```
>>> (3/2 ^ 8L) * (5/4 ^ 1L) / (2/1 ^ 5L)
32805/32768
```

Tenney, Weil and Wilson norms:

```
>>> 1L.syntonicComma
>>> .tenneyHeight
12.6618

>>> 1L.syntonicComma
>>> .weilHeight
12.6797

>>> 1L.syntonicComma
>>> .wilsonHeight
25L
```

* * *

See also: pythagoreanComma, septimalComma

Guides: Tuning Functions, Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Syntonic_comma),
_Xenharmonic_
[1](https://en.xen.wiki/w/81/80)
[2](https://en.xen.wiki/w/Schisma)
