# sort

- _sort([x₁ x₂ …], f:/2=≤, f:/1=⊣)_

Sort the sequence _x_ in place using the comparator _f:/2_.
If the sort block is omitted or is `nil`, sort by `<=`.
Answers the sorted sequence.

At `List` of numbers:

```
>>> let x = [3 2 1];
>>> (x.sort == x, x)
(true, [1 2 3])

>>> let x = [1 2 3];
>>> (x.sort(>) == x, x)
(true, [3 2 1])
```

At `List` of `String`:

```
>>> ['d' 'b' 'c' 'a'].sort
['a' 'b' 'c' 'd']

>>> ['cat' 'fish' 'catfish' 'Cat'].sort
['cat' 'Cat' 'catfish' 'fish']
```

At `Range`:

```
>>> let x = Range(9, 1, -2);
>>> (x == x.sort, x)
(true, Range(1, 9, 2))
```

Sort subsets lexicographically:

```
>>> ['a' 'b' 'c' 'd']
>>> .subsets(true.constant)
>>> .sort(precedes:/2)
[
	[],
	['a'],
	['a', 'b'],
	['a', 'b', 'c'],
	['a', 'b', 'c', 'd'],
	['a', 'b', 'd'],
	['a', 'c'],
	['a', 'c', 'd'],
	['a', 'd'],
	['b'],
	['b', 'c'],
	['b', 'c', 'd'],
	['b', 'd'],
	['c'],
	['c', 'd'],
	['d']
]
```

Sort integers by magnitude:

```
>>> [-11 10 2 1 -4].sort
[-11 -4 1 2 10]
```

Sort by absolute value:

```
>>> [-11 10 2 1 -4].sort(<=, abs:/1)
[1 2 -4 10 -11]
```

Sort strings by dictionary order:

```
>>> ['aa' 'abb' 'ba' 'b' 'aaa'].sort
['aa', 'aaa', 'abb', 'b', 'ba']
```

Sort strings by length:

```
>>> ['aa' 'abb' 'ba' 'b' 'aaa']
>>> .sort(<=, size:/1)
['b' 'ba' 'aa' 'aaa' 'abb']
```

Sort vectors by the Euclidean norm:

```
>>> Sfc32(367814)
>>> .randomInteger([-5 5], [10 3])
>>> .sort(<=, norm:/1)
[
	 3  1 -1;
	 2 -4  0;
	 0 -4 -2;
	-3  0  4;
	 0 -5 -2;
	-5 -3  0;
	-3 -4 -4;
	-3 -4 -4;
	-3  5  4;
	-3  5  5
]
```

Sort complex numbers by real part:

```
>>> [2J-3 0J1 3J-1 1J1].sort(<=, real:/1)
[0J1 1J1 2J-3 3J-1]
```

Relation to `ordering`:

```
>>> [9 7 6 10 3 0 8 3 3 5].sort
[0 3 3 3 5 6 7 8 9 10]

>>> let x = [9 7 6 10 3 0 8 3 3 5];
>>> x.atAll(x.ordering)
[0 3 3 3 5 6 7 8 9 10]
```

With explicit `nil`:

```
>>> [3 1 5 3 7 5 9].sort(nil)
[1 3 3 5 5 7 9]
```

Show comparisons made in doing a sort:

~~~spl svg=A
let n = 200;
let m = 50;
let r = [];
0:n.collect { :x |
	(x.sin * m).round
}.sort { :a :b |
	r.add(a);
	a > b
};
r.downsample(4).scatterPlot
~~~

![](sw/spl/Help/Image/sort-A.svg)

* * *

See also: isSorted, lexicographicSort, mergeSort, ordering, sortBy, sortByOn, sorted, sortOn

Guides: Sort Functions, Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Sort.html)

Categories: Sorting
