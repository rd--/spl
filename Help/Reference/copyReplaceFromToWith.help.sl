# copyReplaceFromToWith

- _copyReplaceFromToWith([x₁ x₂ …], i, j, [y₁ y₂ …])_

Answer a copy of the sequence _x_,
with items from start index _i_ to stop index _j_ replaced with items from the replacement sequence _y_.
The replacement need not be the same size as the deleted region.

Replace the middle of one list with items from another:

```
>>> let a = [1 2 3 4 5 6 7];
>>> let b = [-3 -4 -5];
>>> let c = a.copyReplaceFromToWith(
>>> 	3, 5, b
>>> );
>>> (a, b, c)
(
	[1 2 3 4 5 6 7],
	[-3 -4 -5],
	[1 2 -3 -4 -5 6 7]
)
```

With an empty replacement deletes region:

```
>>> [1 2 3 4 5]
>>> .copyReplaceFromToWith(2, 4, [])
[1 5]
```

With a smaller replacement reduces the size of the region:

```
>>> [1 2 3 4 5]
>>> .copyReplaceFromToWith(2, 4, ['x'])
[1 'x' 5]
```

With a larger replacement expands the size of the region:

```
>>> [1 2 3 4 5]
>>> .copyReplaceFromToWith(
>>> 	2, 4, [-1 -2 -3 -4]
>>> )
[1 -1 -2 -3 -4 5]
```

If the stop index _j_ is one less than the start index _i_,
insert the replacement collection _y_ at _i_:

```
>>> [1 2 3 4 5].copyReplaceFromToWith(
>>> 	3, 2, [0 0 0 0]
>>> )
[1 2 0 0 0 0 3 4 5]
```

If stop index _j_ is the end index and the start index _i_ is one past the end,
append the collection _y_:

```
>>> [1 2 3 4 5].copyReplaceFromToWith(
>>> 	6, 5, [0 0 0 0]
>>> )
[1 2 3 4 5 0 0 0 0]
```

* * *

See also: copy, copyFromTo, copyReplaceFromToWithObject, insertAt

Guides: Copying Functions

References:
_Smalltalk_
5.7.8.9

Categories: Copying
