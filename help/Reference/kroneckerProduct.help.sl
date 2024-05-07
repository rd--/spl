# kroneckerProduct

- _kroneckerProduct(aMatrix, anotherMatrix)_

Answer the Kronecker product of two matrices, which is a block matrix.

```
>>> let a = [0 1; -1 0];
>>> let b = [1 2; 3 4];
>>> a.kroneckerProduct(b)
[
	0 0 1 2;
	0 0 3 4;
	-1 -2 0 0;
	-3 -4 0 0
]

>>> let a = [1 2; 3 4];
>>> let b = [0 5; 6 7];
>>> a.kroneckerProduct(b)
[0 5 0 10; 6 7 12 14; 0 15 0 20; 18 21 24 28]

>>> let a = [0 1 0; 1 1 1; 0 1 0];
>>> let b = [1 1 1 1; 1 0 0 1; 1 1 1 1];
>>> a.kroneckerProduct(b)
[
	0 0 0 0 1 1 1 1 0 0 0 0;
	0 0 0 0 1 0 0 1 0 0 0 0;
	0 0 0 0 1 1 1 1 0 0 0 0;
	1 1 1 1 1 1 1 1 1 1 1 1;
	1 0 0 1 1 0 0 1 1 0 0 1;
	1 1 1 1 1 1 1 1 1 1 1 1;
	0 0 0 0 1 1 1 1 0 0 0 0;
	0 0 0 0 1 0 0 1 0 0 0 0;
	0 0 0 0 1 1 1 1 0 0 0 0
]
```

* * *

See also: cross, dot, inner, outer

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KroneckerProduct)
