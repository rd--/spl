# isLatinSquare

- _isLatinSquare(m)_

Answer `true` if the matrix _m_ is a Latin square, else `false`.

Two, three, four and five latin squares:

```
>>> [
>>> 	1 2;
>>> 	2 1
>>> ].isLatinSquare
true

>>> [
>>> 	1 2 3;
>>> 	2 3 1;
>>> 	3 1 2
>>> ].isLatinSquare
true

>>> [
>>> 	1 2 3 4;
>>> 	2 1 4 3;
>>> 	3 4 1 2;
>>> 	4 3 2 1
>>> ].isLatinSquare
true

>>> [
>>> 	1 2 3 4 5;
>>> 	2 4 1 5 3;
>>> 	3 5 4 2 1;
>>> 	4 1 5 3 2;
>>> 	5 3 2 1 4
>>> ].isLatinSquare
true
```

* * *

See also: isPermutationOf, isSquareMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LatinSquare.html),
_W_
[1](https://en.wikipedia.org/wiki/Latin_square)
