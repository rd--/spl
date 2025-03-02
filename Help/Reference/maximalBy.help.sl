# maximalBy

- _maximalBy(aCollection, aBlock:/1)_

Answer a `List` of the elements of _aCollection_ for which the value of _aBlock_ is maximal.

```
>>> [-2J2 4J1].maximalBy(abs:/1)
[4J1]

>>> [1 2 3; 4 5].maximalBy(size:/1)
[[1 2 3]]
```

Find the maximal element by its last part:

```
>>> ['x' 3; 'y' 2; 'z' 1; 'u' 1; 'v' 2].maximalBy(last:/1)
[['x' 3]]
```

All maximal elements are returned, in order of appearance:

```
>>> ['x' 3; 'y' 3; 'z' 2; 'u' 3; 'v' 1].maximalBy(last:/1)
['x' 3; 'y' 3; 'u' 3]
```

Prune an `Record` to its maximal values:

```
>>> (a: [4 1], b: [2 3], c: [4 2], d: [1 3]).maximalBy(last:/1)
(a: [2 3], d: [1 3])
```

* * *

See also: <, maxBy, max, min, minimalBy

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MaximalBy.html)
