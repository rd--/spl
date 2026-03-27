# butcherTreeCount

- _butcherTreeCount(n)_

Answer the number of unlabeled rooted trees with nodes one to _n_.

Number of unlabeled rooted trees with _n_ nodes,
OEIS [A000081](https://oeis.org/A000081):

```
>>> 31.butcherTreeCount
[
	1
	1
	2
	4
	9
	20
	48
	115
	286
	719
	1842
	4766
	12486
	32973
	87811
	235381
	634847
	1721159
	4688676
	12826228
	35221832
	97055181
	268282855
	743724984
	2067174645
	5759636510
	16083734329
	45007066269
	126186554308
	354426847597
	997171512998
]
```

Number of unlabeled rooted trees with at most _n_ nodes,
OEIS [A087803](https://oeis.org/A087803):

```
>>> 31.butcherTreeCount.prefixSum
[1 2 4 8 17 37 85 200 486 1205 3047 7813]
```

* * *

See also: sum

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A000081)
