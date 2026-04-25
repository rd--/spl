# isMutuallyOrthogonalLatinSquareSet

- _isMutuallyOrthogonalLatinSquareSet([m₁ m₂ …])_

Answer `true` if _m_ is a set of mutually orthogonal latin squares.

Three mutually orthogonal 4×4 latin squares:

```
>>> [
>>> 	1 2 3 4;
>>> 	2 1 4 3;
>>> 	3 4 1 2;
>>> 	4 3 2 1
>>> 	:;
>>> 	1 2 3 4;
>>> 	4 3 2 1;
>>> 	2 1 4 3;
>>> 	3 4 1 2
>>> 	:;
>>> 	1 2 3 4;
>>> 	3 4 1 2;
>>> 	4 3 2 1;
>>> 	2 1 4 3
>>> ].isMutuallyOrthogonalLatinSquareSet
true
```

Three mutually orthogonal 5×5 latin squares:

```
>>> [
>>> 	1 2 3 4 5;
>>> 	2 3 4 5 1;
>>> 	3 4 5 1 2;
>>> 	4 5 1 2 3;
>>> 	5 1 2 3 4
>>> 	:;
>>> 	1 2 3 4 5;
>>> 	3 4 5 1 2;
>>> 	5 1 2 3 4;
>>> 	2 3 4 5 1;
>>> 	4 5 1 2 3
>>> 	:;
>>> 	1 2 3 4 5;
>>> 	5 1 2 3 4;
>>> 	4 5 1 2 3;
>>> 	3 4 5 1 2;
>>> 	2 3 4 5 1
>>> 	:;
>>> 	1 2 3 4 5;
>>> 	4 5 1 2 3;
>>> 	2 3 4 5 1;
>>> 	5 1 2 3 4;
>>> 	3 4 5 1 2
>>> ].isMutuallyOrthogonalLatinSquareSet
true
```

* * *

See also: isLatinSquare, shape
