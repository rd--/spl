# catalanRestrictedGrowthString

- _catalanRestrictedGrowthString(n)_

Answer the _n_-th zero-indexed restricted-growth string in the list given in length-wise and lexicographic order.

The first few terms:

```
>>> 0:45.collect(
>>> 	catalanRestrictedGrowthString:/1
>>> )
[
	0;
	1;
	1 0;
	1 1;
	1 2;
	1 0 0;
	1 0 1;
	1 1 0;
	1 1 1;
	1 1 2;
	1 2 0;
	1 2 1;
	1 2 2;
	1 2 3;
	1 0 0 0;
	1 0 0 1;
	1 0 1 0;
	1 0 1 1;
	1 0 1 2;
	1 1 0 0;
	1 1 0 1;
	1 1 1 0;
	1 1 1 1;
	1 1 1 2;
	1 1 2 0;
	1 1 2 1;
	1 1 2 2;
	1 1 2 3;
	1 2 0 0;
	1 2 0 1;
	1 2 1 0;
	1 2 1 1;
	1 2 1 2;
	1 2 2 0;
	1 2 2 1;
	1 2 2 2;
	1 2 2 3;
	1 2 3 0;
	1 2 3 1;
	1 2 3 2;
	1 2 3 3;
	1 2 3 4;
	1 0 0 0 0;
	1 0 0 0 1;
	1 0 0 1 0;
	1 0 0 1 1
]
```

Join sequuences together as an integer,
OEIS [A239903](https://oeis.org/A239903):

```
>>> 0:45.collect { :n |
>>> 	n.catalanRestrictedGrowthString
>>> 	.fromDigits
>>> }
[
	    0     1    10    11    12
	  100   101   110   111   112
	  120   121   122   123  1000
	 1001  1010  1011  1012  1100
	 1101  1110  1111  1112  1120
	 1121  1122  1123  1200  1201
	 1210  1211  1212  1220  1221
	 1222  1223  1230  1231  1232
	 1233  1234 10000 10001 10010
	10011
]
```

The limit at which the `fromDigits` form becomes ambiguous:

```
>>> 58784.catalanRestrictedGrowthString
[1 2 3 4 5 6 7 8 9 9]

>>> 58785.catalanRestrictedGrowthString
[1 2 3 4 5 6 7 8 9 10]

>>> 11.catalanNumber - 1
58785
```

* * *

See also: catalanNumber

Guides: Combinatorial Functions

References:
_OEIS_
[1](https://oeis.org/A239903)
