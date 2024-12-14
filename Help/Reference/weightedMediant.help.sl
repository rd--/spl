# weightedMediant

- _weightedMediant(aFraction, anotherFraction, aNumber, anotherNumber)_

Answer the weighted mediant of two fractions.
Assign weight _m_ to the left fraction _a/b_,
and weight _n_ to the right fraction _c/d_,
the weighted mediant is _(ma +nc)/(mb + nd)_.

```
>>> let phi = 1.goldenRatio;
>>> let m = weightedMediant(
>>> 	1/3, 1/2,
>>> 	phi, 1
>>> );
>>> let p = (phi * 1) + (1 * 1);
>>> let q = (phi * 3) + (1 * 2);
>>> let n = p / q;
>>> (m, m = n)
(0.38196601125010515, true)
```

The classical case corresponds to a total weight of two, with m = n = 1.

```
>>> weightedMediant(0/1, 1/1, 1, 1)
1/2

>>> mediant(0/1, 1/1)
1/2
```

The noble (phi-weighted) mediant between 5/4 and 9/7:

```
>>> let phi = 1.goldenRatio;
>>> let p = 5/4;
>>> let q = 9/7;
>>> let m = weightedMediant(p, q, 1, phi);
>>> (m, [p q m].ratioToCents)
(
	1.2764,
	[386.314 435.084 422.487]
)

>>> phiWeightedMediant(5/4, 9/7)
1.2764

>>> phiWeightedMediant(1/3, 1/2)
0.4198

>>> phiWeightedMediant(1/2, 1/3)
0.3820
```

```
>>> isPhiWeightedMediantNoble(5/4, 9/7)
true
```

* * *

See also: isPhiWeightedMediantNoble, mediant, phiWeightedMediant

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Merciful_intonation)

Further Reading: Aiylam 2016
