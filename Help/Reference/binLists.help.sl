# binLists

- _binLists(d, b)_
- _binLists(d, b₁, b₂)_

Answer a `List` of lists of the elements of the data list _d_ whose values lie in successive specified bins _b_.
Bins are specified as a _(min, max, width)_ triples.

List elements in specified bins:

```
>>> [1 3 2 1 4 5 6 2].binLists([1 7 1])
[1 1; 2 2; 3; 4; 5; 6]

>>> [1 3 2 1 4 5 6 2].binLists([0 8 2])
[1 1; 3 2 2; 4 5; 6]
```

Make lists of elements in bins of width 1 from 0 to 10:

```
>>> [1 3 2 1 4 5 6 2].binLists([0 10 1])
[; 1 1; 2 2; 3; 4; 5; 6; ; ;]
```

List squares modulo three and five in two-dimensional unit bins:

```
>>> 1:20.collect { :i |
>>> 	mod(i ^ 2, [3 5])
>>> }.binLists([0 2 1], [0 5 1])
[
	[
		[0 0] ! 1,
		[0 1] ! 2,
		[],
		[],
		[0 4] ! 3
	],
	[
		[1 0] ! 3,
		[1 1] ! 6,
		[],
		[],
		[1 4] ! 5
	]
]
```

* * *

See also: binCounts, histogramList

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BinLists.html)
