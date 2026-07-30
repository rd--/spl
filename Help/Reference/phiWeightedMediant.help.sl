# phiWeightedMediant

- _phiWeightedMediant(a/b, c/d)_

Answer the weighted mediant of two fractions,
with weights assigned as _1_ and φ.

```
>>> phiWeightedMediant(0/1, 1/1)
0.61803

>>> phiWeightedMediant(0/1, 1/7)
0.13127

>>> phiWeightedMediant(0/1, 1/6)
0.15110

>>> phiWeightedMediant(0/1, 1/5)
0.17800

>>> phiWeightedMediant(1/5, 2/11)
0.18581

>>> phiWeightedMediant(1/5, 3/14)
0.21170

>>> phiWeightedMediant(0/1, 1/4)
0.21654

>>> phiWeightedMediant(1/4, 2/9)
0.22820

>>> phiWeightedMediant(1/4, 3/13)
0.23384

>>> phiWeightedMediant(0/1, 1/2)
0.38197

>>> phiWeightedMediant(2/7, 5/17)
0.29241

>>> phiWeightedMediant(1/3, 2/7)
0.29569

>>> phiWeightedMediant(1/8, 1/7)
0.13546

>>> phiWeightedMediant(1/7, 1/8)
0.13127

>>> phiWeightedMediant(1/6, 1/7)
0.15110

>>> phiWeightedMediant(1/5, 1/6)
0.17800

>>> phiWeightedMediant(5/4, 9/7)
1.2764

>>> phiWeightedMediant(1/3, 1/2)
0.4198

>>> phiWeightedMediant(1/2, 1/3)
0.3820
```

phi mediant sequence:

```
>>> [1/8 1/7 1/6 1/5 1/4 1/3]
>>> .adjacentPairsCollect(
>>> 	phiWeightedMediant:/2.swap
>>> )
[0.13127 0.15110 0.17800 0.21654 0.27639]
```

* * *

See also: isPhiWeightedMediantNoble, mediant, weightedMediant

Guides: Tuning Functions, Xenharmonic Functions

References:
_Anaphoria_
[1](https://www.anaphoria.com/hrgm.pdf),
_Xenharmonic_
[1](https://en.xen.wiki/w/Merciful_intonation)
