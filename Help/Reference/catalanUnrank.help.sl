# catalanUnrank

- _catalanUnrank(n)_

Implement an un-ranking algorithm for the lexicographic ordering of the Catalan families.
The unranking table is cached as constructed.

First few terms,
OEIS [A014486](https://oeis.org/A014486):

```
>>> 0:53.collect(catalanUnrank:/1)
[
	 0   2   10  12  42
	 44  50  52  56 170
	172 178 180 184 202
	204 210 212 216 226
	228 232 240 682 684
	690 692 696 714 716
	722 724 728 738 740
	744 752 810 812 818
	820 824 842 844 850
	852 856 866 868 872
	880 906 908 914
]
```

The inverse function is `catalanRank`:

```
>>> let n = 53;
>>> 0:n.collect(catalanUnrank:/1)
>>> .collect(catalanRank:/1)
[0 .. n]
```

A related sequence giving the zero-indices, or zero,
OEIS [A080300](https://oeis.org/A080300):

```
>>> let i = 0:5.collect(catalanUnrank:/1);
>>> 0:44.collect { :n |
>>> 	i.indexOf(n) - 1
>>> }.max(0)
[
	0 0 1 0 0 0 0 0 0 0 2 0 3 0 0 0 0 0 0 0
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	0 0 4 0 5
]
```

Plot first few terms,
OEIS [A014486](https://oeis.org/A014486):

~~~spl svg=A
0:250.collect(catalanUnrank:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/catalanUnrank-A.svg)

Plot first few terms of
OEIS [A057514](https://oeis.org/A057514):

~~~spl svg=B
0:200.collect { :n |
	n.catalanUnrank
	.grayEncode
	.digitCount(2, 1) / 2
}.scatterPlot
~~~

![](sw/spl/Help/Image/catalanUnrank-B.svg)

* * *

See also: catalanRank, isDyckWord

Guides: Combinatorial Functions

References:
_OEIS_
[1](https://oeis.org/A014486)
[2](https://oeis.org/A080300)
[3](https://oeis.org/A057514)
