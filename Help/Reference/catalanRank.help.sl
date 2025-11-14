# catalanRank

- _catalanRank(n)_

Implement a ranking algorithm for the lexicographic ordering of the Catalan families.

First few terms,
OEIS [A215406](https://oeis.org/A215406):

```
>>> 0:86.collect(catalanRank:/1)
[
	0 0 1 1 1 1 1 1 1 1 2 2 3 3 3 3 1 1 1 1
	2 2 2 2 3 3 3 3 3 3 3 3 2 2 2 2 2 2 3 3
	3 3 4 4 5 5 5 5 5 5 6 6 7 7 7 7 8 8 8 8
	8 8 8 8 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3
	3 3 3 3 4 4 4
]
```

Relation to `catalanUnrank`:

```
>>> 0:48.collect { :n |
>>> 	n.catalanUnrank
>>> 	.catalanRank
>>> }
[0 .. 48]
```

Relation to `isDyckWord`:

```
>>> 24.catalanUnrank
684

>>> 0:684
>>> .select(isDyckWord:/1)
>>> .collect(catalanRank:/1)
[0 .. 24]
```

Plot first few terms:

~~~spl svg=A
0:300.collect(catalanRank:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/catalanRank-A.svg)

* * *

See also: catalanNumber, catalanUnrank, isDyckWord

Guides: Combinatorial Functions

Further Reading: Kreher 1999, Ruskey 1978
