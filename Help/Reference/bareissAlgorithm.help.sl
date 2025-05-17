# bareissAlgorithm

- _bareissAlgorithm(m)_

Implements the Bareiss algorithm.
Answer the determinant,
or the echelon form,
of the matrix _m_ with integer entries.

The determinants of _2×2_ `Integer` matrices:

```
>>> [1 2; 3 4].bareissAlgorithm
-2

>>> [3 1; 7 -4].bareissAlgorithm
-19

>>> [1 2; 0 2].bareissAlgorithm
2

>>> [4 3; 2 5].bareissAlgorithm
14

>>> [1 4; -1 9].bareissAlgorithm
13
```

The determinants of _3×3_ `Integer` matrices:

```
>>> [1 2 3; 4 5 6; 7 8 9]
>>> .bareissAlgorithm
0

>>> [-1 4 -2; -2 -4 3; 6 -5 1]
>>> .bareissAlgorithm
1

>>> [1 2 4; 5 4 5; 9 2 7]
>>> .bareissAlgorithm
-66

>>> [-2 -1 2; 2 1 4; -3 3 -1]
>>> .bareissAlgorithm
54

>>> [1 2 3; 4 1 6; 7 8 1]
>>> .bareissAlgorithm
104

>>> [2 9 4; 7 5 3; 6 1 8]
>>> .bareissAlgorithm
-360
```

The determinants of _4×4_ `Integer` matrices:

```
>>> [
>>> 	1 2 3 4;
>>> 	4 5 6 7;
>>> 	7 8 9 10;
>>> 	10 11 12 13
>>> ].bareissAlgorithm
0

>>> [
>>> 	1 2 3 1;
>>> 	-1 -1 -1 2;
>>> 	1 3 1 1;
>>> 	-2 -2 0 -1
>>> ].bareissAlgorithm
26

>>> [
>>> 	7 2 -2 4;
>>> 	4 4 1 7;
>>> 	11 -8 9 10;
>>> 	10 5 12 13
>>> ].bareissAlgorithm
-4319
```

The determinant of a _5×5_ `Integer` matrix:

```
>>> ([5 5].iota - 1)
>>> .bareissAlgorithm
0
```

The determinant of a _7×7_ `Integer` matrix:

```
>>> { :i :j |
>>> 	(i = j).if { -1024L } { 1024L }
>>> }.table(1:7, 1:7)
>>> .bareissAlgorithm
377789318629571617095680L
```

* * *

See also: determinant

References:
_W_
[1](https://en.wikipedia.org/wiki/Bareiss_algorithm)
