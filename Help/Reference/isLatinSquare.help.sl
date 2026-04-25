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
>>> 	1 2 3 4;
>>> 	2 4 1 3;
>>> 	3 1 4 2;
>>> 	4 3 2 1
>>> ].isLatinSquare
true

>>> [
>>> 	1 2 3 4 5;
>>> 	2 3 5 1 4;
>>> 	3 5 4 2 1;
>>> 	4 1 2 5 3;
>>> 	5 4 1 3 2
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

The entries need not be integers:

```
>>> [
>>> 	'a' 'b' 'c';
>>> 	'b' 'c' 'a';
>>> 	'c' 'a' 'b'
>>> ].isLatinSquare
true
```

Does not mutate receiver:

```
>>> let m = [
>>> 	1 2 3 4;
>>> 	2 1 4 3;
>>> 	3 4 1 2;
>>> 	4 3 2 1
>>> ];
>>> (m.isLatinSquare, m)
(
	true,
	[
		1 2 3 4;
		2 1 4 3;
		3 4 1 2;
		4 3 2 1
	]
)
```

* * *

See also: isPermutationOf, isSquareMatrix

Guides: Combinatorial Functions, Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LatinSquare.html),
_W_
[1](https://en.wikipedia.org/wiki/Latin_square)
