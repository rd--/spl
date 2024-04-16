# ByteArray

- _ByteArray(anInteger)_

Answer a `ByteArray` of _anInteger_ places, each initialized to `zero`.

A `ByteArray` is an array whose elements are integers between 0 and 255.
Unlike a `List`, a `ByteArray` is of fixed size.

```
>>> let a = ByteArray(5);
>>> a
[0 0 0 0 0].asByteArray
```

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

* * *

See also: asByteArray, List, Float64Array

References:
_Smalltalk_
5.7.15

Categories: Collection, Type
