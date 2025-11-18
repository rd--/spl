# binaryDetectIndex

- _binaryDetectIndex(n, f:/1)_
- _binaryDetectIndex([x₁ x₂ …], f:/1)_

At `Integer`,
answer the smallest index _i_ in _1:n__ for which _f(i)_ answers `true`,
assuming that _f(i)=⊤_ implies _f(i+1)=⊤_.
If there is no such index answer _n+1_.
Used to implement `binarySearch`.

```
>>> let l = [1 3 6 10 15 21 28 36 45 55];
>>> l.collect { :n |
>>> 	l.size.binaryDetectIndex { :index |
>>> 		l[index] >= n
>>> 	}
>>> }
[1 .. 10]
```

At `Sequence`,
answer the least index for which the predicate answers `true`.
Search a list sorted in ascending order:

```
>>> [1 3 6 10 15 21 28 36 45 55]
>>> .binaryDetectIndex { :i |
>>> 	i >= 6
>>> }
3
```

Search a list sorted in descending order.
The approach is the same as searching a list in ascending order, but with the condition inverted:

```
>>> [55 45 36 28 21 15 10 6 3 1]
>>> .binaryDetectIndex { :i |
>>> 	i <= 6
>>> }
8
```

No such index:

```
>>> [1 3 5 7 9]
>>> .binaryDetectIndex { :i |
>>> 	i >= 11
>>> }
6
```

Detect first value that is not a small integer at `Range`:

```
>>> let x = 1E0;
>>> let y = 1E19;
>>> let i = (x .. y).binaryDetectIndex { :n |
>>> 	n.isSmallInteger.not
>>> };
>>> (y - x, i, x + i, (2 ^ 53) - 1)
(
	10000000000000000000L,
	    9007199254740992L,
	    9007199254740992L,
	    9007199254740991L
)
```

* * *

See also: binarySearch, detectIndex

Guides: List Functions

References:
_Go_
[1](https://pkg.go.dev/sort#Search)
