# optimalGolombRulers

- _optimalGolombRulers(m)_

Answer the optimal Golumb ruler of order _m_,
known for _m<=28_.
An Golomb ruler is a set of n distinct non-negative integers called marks,
such that the positive differences computed over all possible pairs of marks are distinct.

Answer optimal rulers:

```
>>> optimalGolombRulers(7)
[
	0  1  4 10 18 23 25;
	0  1  7 11 20 23 25;
	0  1 11 16 19 23 25;
	0  2  3 10 16 21 25;
	0  2  7 13 21 22 25
]

>>> optimalGolombRulers(8)
[
	[0 1 4 9 15 22 32 34]
]
```

The lengths of the known optimal rulers:

```
>>> 2:28.collect { :m |
>>> 	m.optimalGolombRulers
>>> 	.anyOne.last
>>> }
[
	 1    3   6  11  17
	 25  34  44  55  72
	 85 106 127 151 177
	199 216 246 283 333
	356 372 425 480 492
	553 585
]
```

Calculate all differences for order eight:

```
>>> let [r] = 8.optimalGolombRulers;
>>> let k = r.size;
>>> (1 .. k - 1).collect { :i |
>>> 	(i + 1 .. k).collect { :j |
>>> 		r[j] - r[i]
>>> 	}
>>> }
[
	1 4 9 15 22 32 34;
	3 8 14 21 31 33;
	5 11 18 28 30;
	6 13 23 25;
	7 17 19;
	10 12;
	2
]
```

* * *

See also: erdosTuranConstruction, welchCostasArrayList

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GolombRuler.html),
_OEIS_
[1](https://oeis.org/A003022),
_W_
[1](https://en.wikipedia.org/wiki/Golomb_ruler)
