# constantArray

- _constantArray(aShape, anObject)_

Answer an array having _aShape_ where each entry is _anObject_.

A vector of five threes:

```
>>> [5].constantArray(3)
[3 3 3 3 3]
```

A 3×4 array of fives:

```
>>> [3 4].constantArray(5)
[5 5 5 5; 5 5 5 5; 5 5 5 5]
```

A matrix of exact zeros:

```
>>> [3 3].constantArray(0)
[0 0 0; 0 0 0; 0 0 0]
```

A deeply nested constant array (tree):

```
>>> [2 1 2 1 2].constantArray(0)
[[[[[0 0]] [[0 0]]]] [[[[0 0]] [[0 0]]]]]
```

* * *

See also: identityMatrix, iota, Range, reshape, table, unitVector

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ConstantArray.html)
