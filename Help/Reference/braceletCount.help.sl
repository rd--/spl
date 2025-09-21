# braceletCount

- _braceletCount(n, k)_

Answers the number of _n_-bead bracelets with up to _k_ different colored beads.
A bracelet,
also called a turnover or free necklace,
is a necklace that is considered equivalent under reflection.

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

* * *

See also: necklaceCount

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Necklace.html),
_OEIS_
[1](https://oeis.org/A081720)
[2](https://oeis.org/A000029),
_W_
[1](https://en.wikipedia.org/wiki/Bracelet_(combinatorics))
