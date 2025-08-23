# deleteDuplicates

- _deleteDuplicates([x₁ x₂ …], f:/2)_

Answer a copy of the collection _x_ that removes any duplicates, according to _f_.

At `List`:

```
>>> [1 3 5 3 5 9 5 2 3 5 7 3 5 7 3]
>>> .deleteDuplicates
[1 3 5 9 2 7]

>>> [1 7 8 4 3 4 1 9 9 2].deleteDuplicates
[1 7 8 4 3 9 2]
```

At `Record`, delete elements whose values duplicate those seen earlier:

```
>>> (a: 1, b: 2, c: 1, d: 3, e: 2)
>>> .deleteDuplicates
(a: 1, b: 2, d: 3)
```

Delete elements that are preceded by at least one larger element:

```
>>> [1 7 8 4 3 4 1 9 8 9 2]
>>> .deleteDuplicates(>)
[1 7 8 9 9]
```

Treat numbers as equal if they differ by 0.01 or less:

```
>>> [3 3.1 3.11 3.5 3.51]
>>> .deleteDuplicates { :i :j |
>>> 	(i - j).abs <= 0.01
>>> }
[3 3.1 3.5]
```

Similar to `union` with an empty set:

```
>>> let x = [
>>> 	9 0 0 3 2 3 6 2 9 8
>>> 	4 9 0 2 6 5 7 4 9 8
>>> ];
>>> (
>>> 	x.deleteDuplicates,
>>> 	x.union([])
>>> )
(
	[9 0 3 2 6 8 4 5 7],
	[9 0 3 2 6 8 4 5 7]
)
```

Delete items that sum to the same amount as an earlier item:

```
>>> let m = [
>>> 	0 0 0 1 0;
>>> 	1 0 1 0 1;
>>> 	1 1 1 0 0;
>>> 	0 0 0 0 1;
>>> 	1 1 1 0 1
>>> ];
>>> m.deleteDuplicates { :i :j |
>>> 	i.sum = j.sum
>>> }
[0 0 0 1 0; 1 0 1 0 1; 1 1 1 0 1]
```

_Note:_
This does not actually delete elements from the collection,
it answers a copy of the collection without the duplicate elements.

* * *

See also: counts, deleteAdjacentDuplicates, nub, nubBy, unique

References:
_Apl_
[1](https://aplwiki.com/wiki/Unique),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteDuplicates.html)
