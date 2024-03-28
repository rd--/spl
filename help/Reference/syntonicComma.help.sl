# syntonicComma

- _syntonicComma(aNumber)_

Answer _aNumber_ times the syntonic comma.

The syntonic comma is the interval with the superparticular ratio 81/80.

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

It has lattice coordinates _[-4 4 1>_:

```
>>> 1.syntonicComma.factorInteger
[2 -> -4, 3 -> 4, 5 -> 1]
```

It is the distance between the Ptolemaic and Pythagorean chromatic semitones:

```
>>> (135/128 * 1.syntonicComma)
1.pythagoreanChroma
```

* * *

See also: pythagoreanComma, septimalComma

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/81/80)
