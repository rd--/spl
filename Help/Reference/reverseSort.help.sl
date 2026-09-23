# reverseSort

- _reverseSort([x₁ x₂ …])_

Answer the reverse sort of the sequence _x_.
There are copying and in place forms.

At a list of integers:

```
>>> [1 3 5 2 4].reverseSortInPlace
[5 4 3 2 1]

>>> [1 3 5 2 4].sortInPlace.reverse
[5 4 3 2 1]
```

At a list of lists:

```
>>> 1:9.integerDigits(2, 4)
>>> .reverseSortInPlace
[
	1 0 0 1;
	1 0 0 0;
	0 1 1 1;
	0 1 1 0;
	0 1 0 1;
	0 1 0 0;
	0 0 1 1;
	0 0 1 0;
	0 0 0 1
]
```

When requested, operation is in place:

```
>>> let x = [2 1 4 3];
>>> let y = x.reverseSortInPlace;
>>> let z = x.reverseSort;
>>> (y, x == y, z, x == z)
([4 3 2 1], true, [4 3 2 1], false)
```

* * *

See also: reverse, sort

Guides: Sort Functions
