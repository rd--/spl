# syntonicComma

- _syntonicComma(n)_

Answer the syntonic comma,
also known as the Didymus’ comma or the meantone comma or the Ptolemaic comma,
raised to the number _n_.

The syntonic comma comma is the interval with the superparticular ratio 81/80.

```
>>> 1.syntonicComma
81/80

>>> 1.syntonicComma
>>> .isSuperparticular
true
```

It has size of approximately 21.5¢:

```
>>> 1.syntonicComma
>>> .ratioToCents
21.506

>>> 1.syntonicComma
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
1.syntonicComma
```

and between 81/16 and 5/1:

```
>>> 3/2 ^ 4 / 5
1.syntonicComma
```

or more usually between 81/64 and 5/4, the 3- and 5- limit major thirds
(the just major third and the Pythagorean ditone):

```
>>> 81/64 / 5/4
1.syntonicComma
```

It has tuning lattice coordinates _-4 4 -1_:

```
>>> 1.syntonicComma
>>> .factorInteger
[2 -4; 3 4; 5 -1]

>>> 1.syntonicComma
>>> .primeExponents
[-4 4 -1]
```

It is the distance between the Ptolemaic and Pythagorean chromatic semitones:

```
>>> (135/128 * 1.syntonicComma)
1.pythagoreanChroma
```

The schisma, 32805/32768, is the difference between the Pythagorean comma and the syntonic comma:

```
>>> 1.pythagoreanComma
>>> /
>>> 1.syntonicComma
32805/32768
```

The schisma also is the difference between eight perfect fifths plus a major third and five octaves;

```
>>> (3/2 ^ 8) * (5/4 ^ 1) / (2/1 ^ 5)
32805/32768
```

Tenney, Weil and Wilson norms:

```
>>> 1.syntonicComma.tenneyHeight
12.6618

>>> 1.syntonicComma.weilHeight
12.6797

>>> 1.syntonicComma.wilsonHeight
25
```

* * *

See also: pythagoreanComma, septimalComma

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Syntonic_comma),
_Xenharmonic_
[1](https://en.xen.wiki/w/81/80)
[2](https://en.xen.wiki/w/Schisma)

Categories: Math, Contant, Tuning
