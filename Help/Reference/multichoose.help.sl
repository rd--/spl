# multichoose

- _multichoose(n, k)_

The number of multisets of length _k_ on _n_ symbols.

```
>>> 1:5.collect { :k |
>>> 	1:5.collect { :n |
>>> 		n.multichoose(k)
>>> 	}
>>> }
[
	1 2  3  4  5;
	1 3  6 10 15;
	1 4 10 20 35;
	1 5 15 35 70;
	1 6 21 56 126
]

>>> multichoose:/2.table(1:5, 1:5)
[
	1  1  1  1   1;
	2  3  4  5   6;
	3  6 10 15  21;
	4 10 20 35  56;
	5 15 35 70 126
]
```

* * *

See also: Multiset, binomial, multinomial

Guides: Set Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Multichoose.html)
