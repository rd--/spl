# antidiagonalIndicesDo

- _antidiagonalIndicesDo(k, f:/2)_

Visit the first _k_ indices of an infinite matrix in (falling) antidiagonal sequence.

```
>>> let l = [];
>>> 23.antidiagonalIndicesDo { :m :n |
>>> 	l.add([m, n])
>>> };
>>> l
[
	1 1;
	1 2; 2 1;
	1 3; 2 2; 3 1;
	1 4; 2 3; 3 2; 4 1;
	1 5; 2 4; 3 3; 4 2; 5 1;
	1 6; 2 5; 3 4; 4 3; 5 2; 6 1;
	1 7; 2 6
]
```

* * *

See also: antidiagonal, antidiagonalArray, antidiagonalMatrix

Guides: Array Functions, Matrix Functions
