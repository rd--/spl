# braceletCount

- _braceletCount(n, k)_

Answers the number of _n_-bead bracelets with up to _k_ different coloured beads.
A bracelet,
also called a turnover or free necklace,
is a necklace that is considered equivalent under reflection.

Table giving number of bracelets with _n_ beads of _k_ colours,
OEIS [A081720](http://oeis.org/A081720):

```
>>> 1:7.collect { :n |
>>> 	1:n.collect { :k |
>>> 		braceletCount(n, k)
>>> 	}
>>> }
[
	1;
	1 3;
	1 4 10;
	1 6 21 55;
	1 8 39 136 377;
	1 13 92 430 1505 4291;
	1 18 198 1300 5895 20646 60028
]
```

First few counts for _k=2_,
OEIS [A000029](https://oeis.org/A000029):

```
>>> 1:15.collect { :n |
>>> 	braceletCount(n, 2)
>>> }
[
	  2    3    4    6    8
	 13   18   30   46   78
	126  224  380  687 1224
]
```

First few counts for _k=3_,
OEIS [A027671](https://oeis.org/A027671):

```
>>> 1:15.collect { :n |
>>> 	braceletCount(n, 3)
>>> }
[
	3 6 10 21 39
	92 198 498 1219 3210
	8418 22913 62415 173088 481598
]
```

First few counts for _k=4_,
OEIS [A032275](https://oeis.org/A032275):

```
>>> 1:14.collect { :n |
>>> 	braceletCount(n, 4)
>>> }
[
	4 10 20 55 136
	430 1300 4435 15084 53764
	192700 704370 2589304 9608050
]
```

* * *

See also: necklaceCount

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Necklace.html)
[2](https://mathworld.wolfram.com/Free.html),
_OEIS_
[1](https://oeis.org/A081720)
[2](https://oeis.org/A000029)
[3](https://oeis.org/A027671)
[4](https://oeis.org/A032275),
_W_
[1](https://en.wikipedia.org/wiki/Bracelet_(combinatorics))
