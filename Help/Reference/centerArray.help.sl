# centerArray

- _centerArray(aList, anInteger, anObject)_

Answer a `List` of length _anInteger_ with the elements of _aList_ at the center and _anObject_ elsewhere.

A one and four zeroes:

```
>>> [1].centerArray(5, 0)
[0 0 1 0 0]
```

If the prefix and suffix cannot be equal,
bias left:

```
>>> [1].centerArray(6, 0)
[0 0 0 1 0 0]
```

Two ones and six zeroes:

```
>>> [1 1].centerArray(8, 0)
[0 0 0 1 1 0 0 0]
```

* * *

See also: padLeft, padRight, reshape

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CenterArray.html)
