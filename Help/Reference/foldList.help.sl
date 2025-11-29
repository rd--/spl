# foldList

- _foldList(f:/2, y, [x₁ x₂ …])_
- _foldList([x₁ x₂ …], y, f:/2)_

Apply a the binary block _f_ to each element of the sequence _x_,
passing an accumulating parameter,
initially _y_,
from left to right.

Cumulative sums of the elements of the list:

```
>>> +.foldList(3, [1 1 1 1])
[3 4 5 6 7]

>>> [1 1 1 1].foldList(3, +)
[3 4 5 6 7]

>>> +.foldList(0, 1:9)
[0 1 3 6 10 15 21 28 36 45]

>>> 1:9.foldList(0, +)
[0 1 3 6 10 15 21 28 36 45]
```

Cumulative powers:

```
>>> ^.foldList(2, [2 3 2 3])
[2 4 64 4096 68719476736]

>>> [2 3 2 3].foldList(2, ^)
[2 4 64 4096 68719476736]
```

Perform a chain of cross products:

```
>>> cross:/2.foldList(
>>> 	[1 -1 1],
>>> 	[0 1 1; 1 1 -1]
>>> )
[1 -1 1; -2 -1 1; 0 -1 -1]

>>> [0 1 1; 1 1 -1]
>>> .foldList([1 -1 1], cross:/2)
[1 -1 1; -2 -1 1; 0 -1 -1]
```

Successively append to a string:

```
>>> 1:4.foldList('0') { :p :q |
>>> 	p ++ q.printString
>>> }
['0' '01' '012' '0123' '01234']
```

Compute successive factorials:

```
>>> 1:10.foldList(1, *)
[
	1 1 2 6 24 120 720 5040
	40320 362880 3628800
]
```

Compute products of successive primes:

```
>>> 1:10.prime.foldList(1, *)
[
	1 2 6 30 210 2310 30030 510510
	9699690 223092870 6469693230
]
```

Build up a number from digits:

```
>>> [4 5 1 6 7 8].foldList(0) { :p :q |
>>> 	10 * p + q
>>> }
[0 4 45 451 4516 45167 451678]
```

Find the running maximum of a list:

```
>>> [
>>> 	1 3 1 2 4 1 5 3 6 2 8 11
>>> ].foldList(0, max:/2)
[0 1 3 3 3 4 4 5 5 6 6 8 11]
```

Build up a binary tree:

```
>>> [1 2 3 4].foldList(0) { :p :q | [p, q] }
[
	0,
	[0, 1],
	[[0, 1], 2],
	[[[0, 1], 2], 3],
	[[[[0, 1], 2], 3], 4]
]
```

Build up a left-branching binary tree:

```
>>> [1 2 3 4].foldList(0) { :p :q | [q, p] }
[
	0,
	[1, 0],
	[2, [1, 0]],
	[3, [2, [1, 0]]],
	[4, [3, [2, [1, 0]]]]
]
```

`foldList` makes a list of length _n + 1_:

```
>>> 1:9.foldList(0, rightIdentity:/2)
[0 1 2 3 4 5 6 7 8 9]
```

Folding with an empty list does not apply the function at all:

```
>>> [].foldList(0) { :p :q | [].error }
[0]
```

`injectInto` gives the last element of `foldList`:

```
>>> 1:5.foldList(0, +).last
1:5.injectInto(0, +)
```

`accumulate` is equivalent to `foldList` with `+`:

```
>>> [1 2 3 4].accumulate
[2 3 4].foldList(1, +)
```

Compute the minimum number of coins of different value needed to make up an amount:

```
>>> [25 10 5].foldList(163, %) // [25 10 5 1]
[6 1 0 3]
```

Amortize a 5% loan of 1000 with 10 annual payments of 90:

```
>>> List(10, 90).foldList(1000) { :x :i |
>>> 	(x * 1.05).round - i
>>> }
[
	1000 960 918 874 828
	779 728 674 618 559
	497
]
```

Calculate the accumulated distance at each point along a straight line path:

```
>>> let h = 2.sqrt;
>>> [0 0; 1 1; 1 0; 2 1; 2 0]
>>> .adjacentPairsCollect(
>>> 	euclideanDistance:/2
>>> ).foldList(0, +)
[0, h, h + 1, 2 * h + 1, 2 * h + 2]
```

Central polygonal numbers,
OEIS [A000124](https://oeis.org/A000124):

```
>>> 1:13.foldList(1, +)
[
	 1  2  4  7 11 16 22 29 37 46
	56 67 79 92
]
```

* * *

See also: accumulate, collect, differences, foldLeft, injectInto, ratios

Guides: List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:mapAccumL),
_OEIS_
[1](https://oeis.org/A000124),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FoldList.html)
