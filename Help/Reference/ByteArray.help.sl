# ByteArray

- _ByteArray(n)_
- _ByteArray([b₁ b₂ …])_

`ByteArray` is a `Type` holding an array whose elements are integers between 0 and 255.
Unlike a `List`, a `ByteArray` is of fixed size.

At `Integer`,
answer a `ByteArray` of _n_ places,
each initialized to `zero`.

```
>>> ByteArray(5)
ByteArray([0 0 0 0 0])
```

At `List`,
answer a `ByteArray` with the specified bytes:

```
>>> ByteArray([1 2 3 4 5])
ByteArray([1 2 3 4 5])
```

At `Range`:

```
>>> ByteArray(1:5)
ByteArray([1 2 3 4 5])
```

`ByteArray` implements `Collection`:

```
>>> ByteArray([1 3 5 7]) ^ 2
ByteArray([1 9 25 49])
```

`ByteArray` implements `Sequence`:

```
>>> ByteArray([1 3 5 7 9])
>>> .last(3)
ByteArray([5 7 9])
```

The inverse of `asByteArray` is `asList`:

```
>>> [1 3 5 7 9]
>>> .asByteArray
>>> .asList
[1 3 5 7 9]
```

Get the length of a `ByteArray`:

```
>>> ByteArray(1:32).size
32
```

Reverse a `ByteArray`:

```
>>> ByteArray(1:5).reverse
ByteArray([5 4 3 2 1])
```

* * *

See also: asByteArray, asList, List, Float64Array

References:
_Mathematica_
[1](https://reference.wolframcloud.com/language/ref/ByteArray.html),
_Smalltalk_
5.7.15,
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#table-49)

Categories: Collection, Type
