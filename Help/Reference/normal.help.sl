# normal

- _normal(anObject)_

Converts an object to a normal form from a special form.

At `SparseArray` answers a normal dense list:

```
>>> SparseArray([[4] -> 'a', [9] -> 'b']).normal
[0 0 0 'a' 0 0 0 0 'b']
```

At `NumericArray` answers a normal dense list:

```
>>> NumericArray([3 3].iota)
>>> .normal
[
	1 2 3;
	4 5 6;
	7 8 9
]
```

At `Fraction` answer the normalized form:

```
>>> let n = ReducedFraction(2, 4);
>>> (n.asList, n.normal.asList)
([2 4], [1 2])
```

Fractions are ordinarily normalized by construction.

```
>>> (Fraction(2, 4).asList, 2/4.asList)
([1 2], [1 2])
```

At `List` is the identity function:

```
>>> [1 2 3; 4 5 6].normal
[1 2 3; 4 5 6]
```

* * *

See also: List, NumericArray, SparseArray
