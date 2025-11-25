# isTriangularArray

- _isTriangularArray(a)_

Answer `true` if _a_ is a triangular array.

A regular triangular array:

```
>>> [1; 2 3; 4 5 6]
>>> .isTriangularArray
true
```

An inverted triangular array:

```
>>> [1 2 3; 4 5; 6]
>>> .isTriangularArray
true
```

A rectangular array:

```
>>> [1 2; 3 4; 5 6]
>>> .isTriangularArray
false
```

Irregular triangular arrays,
as answered by `triangularArray` where _k_ is not `zero`:

```
>>> [1 2; 3 4 5; 6 7 8 9]
>>> .isTriangularArray
false

>>> [1; 2; 3 4]
>>> .isTriangularArray
false
```

* * *

See also: isMatrix, isVector, triangularArray

Guides: Array Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NumberTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_array)
