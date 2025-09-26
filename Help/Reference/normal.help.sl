# normal

- _normal(x)_

Convert the object _x_ to a normal form from a special form.

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

At `LargeInteger` answers `asInteger`:

```
>>> 23L.normal
23

>>> (2L ^ 54).normal
18014398509481984L
```

At `List` is the identity function:

```
>>> [1 2 3; 4 5 6].normal
[1 2 3; 4 5 6]
```

At `LargeInteger` answers a `SmallFloat` if the integer can be properly represented:

```
>>> 23L.normal
23

>>> (23L ^ 13).normal
504036361936467383L
```

* * *

See also: List, NumericArray, SparseArray

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Normal.html)
