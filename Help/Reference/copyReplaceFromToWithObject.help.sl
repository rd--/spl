# copyReplaceFromToWithObject

- _copyReplaceFromToWithObject([x₁ x₂ …], i, j, y)_

Answer a copy of the sequence _x_,
with items from start index _i_ to stop index _j_ replaced by the object _y_.

```
>>> let a = [1 2 3 4 5 6 7];
>>> let b = a.copyReplaceFromToWithObject(
>>> 	3, 5, 0
>>> );
>>> (a, b)
(
	[1 2 3 4 5 6 7],
	[1 2 0 0 0 6 7]
)
```

If the stop index _j_ is one less than the start index _i_,
insert the object _y_ at _i_:

```
>>> [1 2 3 4 5]
>>> .copyReplaceFromToWithObject(3, 2, 0)
[1 2 0 3 4 5]
```

If the stop index _j_ is the end index and the start index _i_ is one past the end,
insert object at end:

```
>>> [1 2 3 4 5]
>>> .copyReplaceFromToWithObject(6, 5, 0)
[1 2 3 4 5 0]
```

* * *

See also: copy, copyFromTo, copyReplaceFromToWith, insertAt

Guides: Copying Functions

References:
_Smalltalk_
5.7.8.10

Categories: Copying
