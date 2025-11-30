# reverseSort

- _reverseSort([x₁ x₂ …])_

Answer the reverse sort of the sequence _x_.
The sort and reverse are both in place.

At a list of integers:

```
>>> [1 3 5 2 4].reverseSort
[5 4 3 2 1]

>>> [1 3 5 2 4].sort.reverse
[5 4 3 2 1]
```

At a list of lists:

```
>>> 1:9.integerDigits(2, 4)
>>> .reverseSort
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

Operation is in place:

```
>>> let x = [2 1 4 3];
>>> let y = x.reverseSort;
>>> (y, x == y)
([4 3 2 1], true)
```

* * *

See also: reverse, sort

Guides: Sort Functions
