# syntonicComma

- _syntonicComma(aNumber)_

Answer the syntonic comma raised to _aNumber_.

The syntonic (or syntonic or Ptolemaic) comma is the interval with the superparticular ratio 81/80.

```
>>> 1.syntonicComma
81/80
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

It has lattice coordinates _-4 4 -1_:

```
>>> 1.syntonicComma.factorInteger
[2 -> -4, 3 -> 4, 5 -> -1]
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

* * *

See also: pythagoreanComma, septimalComma

Guides: Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/81/80)
[2](https://en.xen.wiki/w/Schisma)

Categories: Math, Contant, Tuning
