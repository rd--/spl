# centerArray

- _centerArray([c₁ c₂ …], n, x)_

Answer a `List` of length _n_ with the elements of the list _c_ at the center,
and the object _x_ elsewhere.

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
