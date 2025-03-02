# minimalBy

- _minimalBy(aCollection, aBlock:/1)_

Answer a `List` of the elements of _aCollection_ for which the value of _aBlock_ is minimal.

```
>>> [-2J2 4J1].minimalBy(abs:/1)
[-2J2]

>>> [1 2 3; 4 5].minimalBy(size:/1)
[[4 5]]
```

Find the minimal element by its last part:

```
>>> ['x' 3; 'y' 2; 'z' 2; 'u' 1; 'v' 3].minimalBy(last:/1)
[['u' 1]]
```

All minimal elements are returned, in order of appearance:

```
>>> ['x' 1; 'y' 1; 'z' 2; 'u' 1; 'v' 3].minimalBy(last:/1)
['x' 1; 'y' 1; 'u' 1]
```

Prune an `Record` to its minimal values:

```
>>> (a: [4 1], b: [2 3], c: [4 2], d: [1 1]).minimalBy(last:/1)
(a: [4 1], d: [1 1])
```

* * *

See also: <, maxBy, max, min, reduce

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MinimalBy.html)
