# ByteArray

- _ByteArray(n)_
- _ByteArray([x, …])_

Answer a `ByteArray` of _anInteger_ places, each initialized to `zero`.

A `ByteArray` is an array whose elements are integers between 0 and 255.
Unlike a `List`, a `ByteArray` is of fixed size.

```
>>> ByteArray(5)
[0 0 0 0 0].asByteArray
```

`asByteArray` creates a `ByteArray` from a sequence of byte values.
`ByteArray` implements `Collection`:

```
>>> [1 3 5 7].asByteArray ^ 2
[1 9 25 49].asByteArray
```

`ByteArray` implements `Sequence`:

```
>>> [1 3 5 7 9].asByteArray.last(3)
[5 7 9].asByteArray
```

The inverse of `asByteArray` is `asList`:

```
>>> [1 3 5 7 9].asByteArray.asList
[1 3 5 7 9]
```

Get the length of a `ByteArray`:

```
>>> 1:32.asByteArray.size
32
```

Reverse a `ByteArray`:

```
>>> 1:5.asByteArray.reverse.asList
[5 4 3 2 1]
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
