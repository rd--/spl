# isInvolutoryMatrix

- _isInvolutoryMatrix(m)_

Answer `true` if _m_ is an involutory matrix,
a square matrix that is its own inverse.

The Pauli matrices in _M(2C)_ are involutory:

```
>>> [0 1; 1 0]
>>> .isInvolutoryMatrix
true

>>> [0 -1I; 1I 0]
>>> .isInvolutoryMatrix
true

>>> [1 0; 0 -1]
>>> .isInvolutoryMatrix
true
```

The identity matrix is involutory:

```
>>> 3.identityMatrix
>>> .isInvolutoryMatrix
true
```

The twenty-six length five permutation that give involutory matrices,
`involutionNumber` counts such matrices:

```
>>> 5.involutionNumber
26

>>> [1 .. 5].permutations
>>> .select { :p |
>>> 	p.permutationMatrix
>>> 	.isInvolutoryMatrix
>>> }
[
	1 2 3 4 5;
	1 2 3 5 4;
	1 2 4 3 5;
	1 2 5 4 3;
	1 3 2 4 5;
	1 3 2 5 4;
	1 4 3 2 5;
	1 4 5 2 3;
	1 5 3 4 2;
	1 5 4 3 2;
	2 1 3 4 5;
	2 1 3 5 4;
	2 1 4 3 5;
	2 1 5 4 3;
	3 2 1 4 5;
	3 2 1 5 4;
	3 4 1 2 5;
	3 5 1 4 2;
	4 2 3 1 5;
	4 2 5 1 3;
	4 3 2 1 5;
	4 5 3 1 2;
	5 2 3 4 1;
	5 2 4 3 1;
	5 3 2 4 1;
	5 4 3 2 1
]
```

Plot the twenty-six 5×5 involutory permutation matrices:

~~~spl svg=A
[1 .. 5].permutations
.collect(permutationMatrix:/1)
.select(isInvolutoryMatrix:/1)
.collect(matrixPlot:/1)
.PlotSet([5 6])
~~~

![](sw/spl/Help/Image/isInvolutoryMatrix-A.svg)

* * *

See also: inverse, involutionNumber, isSquareMatrix, isSymmetricMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InvolutoryMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Involutory_matrix)
