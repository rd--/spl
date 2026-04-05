# optimalGolombRulers

- _optimalGolombRulers(m)_

Answer the optimal Golumb ruler of order _m_,
known for _m<=28_.
An Golomb ruler is a set of n distinct non-negative integers called marks,
such that the positive differences computed over all possible pairs of marks are distinct.

Marks on lexicographically earliest 6-mark optimal Golomb ruler,
OEIS [A079283](https://oeis.org/A079283):

```
>>> 6.optimalGolombRulers.first
[0 1 4 10 12 17]

>>> 6.optimalGolombRulers
[
	0 1 4 10 12 17;
	0 1 4 10 15 17;
	0 1 8 11 13 17;
	0 1 8 12 14 17
]
```

Marks on lexicographically earliest seven-mark optimal Golomb ruler,
OEIS [A079287](https://oeis.org/A079287):

```
>>> 7.optimalGolombRulers.first
[0 1 4 10 18 23 25]

>>> optimalGolombRulers(7)
[
	0  1  4 10 18 23 25;
	0  1  7 11 20 23 25;
	0  1 11 16 19 23 25;
	0  2  3 10 16 21 25;
	0  2  7 13 21 22 25
]
```

Marks on lexicographically earliest eight-mark optimal Golomb ruler,
OEIS [A079423](https://oeis.org/A079423):

```
>>> 8.optimalGolombRulers.first
[0 1 4 9 15 22 32 34]

>>> 8.optimalGolombRulers.size
1
```

Marks on lexicographically earliest nine-mark optimal Golomb ruler,
OEIS [A079425](https://oeis.org/A079425):

```
>>> 9.optimalGolombRulers.first
[0 1 5 12 25 27 35 41 44]

>>> 9.optimalGolombRulers.size
1
```

The lengths of the known optimal rulers,
OEIS [A003022](https://oeis.org/A003022):

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

Number of inequivalent Golomb rulers with n marks and shortest length,
OEIS [A036501](https://oeis.org/A036501):

```
>>> 2:19.collect { :m |
>>> 	m.optimalGolombRulers.size
>>> }
[1 1 1 2 4 5 1 1 1 2 1 1 1 1 1 1 1 1]
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

Triangle read by rows,
each row gives marks on lexicographically earliest _n_-mark optimal Golomb ruler,
OEIS [A106683](https://oeis.org/A106683):

~~~spl svg=A oeis=A106683
>>> 2:12.collect { :m |
>>> 	m.optimalGolombRulers.first
>>> }.catenate.discretePlot
~~~

![](Help/Image/optimalGolombRulers-A.svg)

* * *

See also: erdosTuranConstruction, welchCostasArrayList

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GolombRuler.html),
_OEIS_
[1](https://oeis.org/A003022),
_W_
[1](https://en.wikipedia.org/wiki/Golomb_ruler)
