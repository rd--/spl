# isDuplicateFree

- _isDuplicateFree(c, f:/2)_

Answer `true` if the collection _c_ has no duplicates according to the block _f_, and `false` otherwise.

Determine whether or not a list has duplicated elements:

```
>>> [1 7 8 4 3 4 1 9 9 2].isDuplicateFree(=)
false
```

Use `asIdentityBag` to reveal duplicate elements:

```
>>> [1 7 8 4 3 4 1 9 9 2]
>>> .asIdentityBag
>>> .sortedElements
[
	1 -> 2,
	2 -> 1,
	3 -> 1,
	4 -> 2,
	7 -> 1,
	8 -> 1,
	9 -> 2
]
```

Determine whether or not the sublists have the same total:

```
>>> [
>>> 	0 0 0 1 0;
>>> 	1 0 1 0 1;
>>> 	1 1 1 0 0;
>>> 	0 0 0 0 1;
>>> 	1 1 1 0 1
>>> ].isDuplicateFree { :p :q |
>>> 	p.sum = q.sum
>>> }
false
```

Construct the permanent analog of the totally antisymmetric tensor:

```
>>> [1 2 3].tuples(3).collect { :x |
>>> 	x.isDuplicateFree(=)
>>> }.boole.reshape([3 3 3])
[
	0 0 0; 0 0 1; 0 1 0:;
	0 0 1; 0 0 0; 1 0 0:;
	0 1 0; 1 0 0; 0 0 0
]
```

* * *

See also: countDistinct, counts, deleteDuplicates, deleteAdjacentDuplicates, isSquareFree

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DuplicateFreeQ.html)

Categories: Testing
