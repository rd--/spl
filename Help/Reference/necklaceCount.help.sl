# necklaceCount

- _necklaceCount(n, k)_
- _necklaceCount(n, [m])_

Answers the number of _n_-bead necklaces,
either with up to _k_ different colored beads,
or with exactly _m_ different colored beads.

```
>>> 1:7.collect { :n |
>>> 	1:n.collect { :k |
>>> 		necklaceCount(n, k)
>>> 	}
>>> }
[
	1;
	1 3;
	1 4 11;
	1 6 24 70;
	1 8 51 208 629;
	1 14 130 700 2635 7826;
	1 20 315 2344 11165 39996 117655
]
```

First few counts for _k=2_,
OEIS [A000031](https://oeis.org/A000031):

```
>>> 1:15.collect { :n |
>>> 	necklaceCount(n, 2)
>>> }
[
	  2    3    4    6    8
	 14   20   36   60  108
	188  352  632 1182 2192
]
```

Exactly _k_ beads:

```
>>> 1:8.collect { :n |
>>> 	1:n.collect { :k |
>>> 		necklaceCount(n, [k])
>>> 	}
>>> }
[
	1;
	1 1;
	1 2 2;
	1 4 9 6;
	1 6 30 48 24;
	1 12 91 260 300 120;
	1 18 258 1200 2400 2160 720;
	1 34 729 5106 15750 23940 17640 5040
]
```

* * *

See also: braceletCount, divisors, eulerPhi, factorial, stirlingS2

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Necklace.html),
_OEIS_
[1](https://oeis.org/A054631)
[2](https://oeis.org/A000031)
[3](https://oeis.org/A087854),
_W_
[1](https://en.wikipedia.org/wiki/Necklace_(combinatorics))
