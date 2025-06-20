# sort

- _sort([x₁ x₂ …], f:/2=≤)_

Sort the sequence _x_ in place using the comparator _f_.
If the sort block is omitted or is nil, sort by `<=`.
Answers the sorted sequence.

At `List` of numbers:

```
>>> let a = [3 2 1];
>>> (a.sort == a, a)
(true, [1 2 3])

>>> let a = [1 2 3];
>>> (a.sort(>) == a, a)
(true, [3 2 1])
```

At `List` of `String`:

```
>>> ['d' 'b' 'c' 'a'].sort
['a' 'b' 'c' 'd']

>>> ['cat' 'fish' 'catfish' 'Cat'].sort
['cat' 'Cat' 'catfish' 'fish']
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

* * *

See also: isSorted, lexicographicSort, mergeSort, ordering, sortBy, sorted, sortOn, sortOnBy

Guides: Sort Functions, Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Sort.html)

Categories: Sorting
