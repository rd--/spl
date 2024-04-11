# permutationMatrix

- _permutationMatrix(aSequence)_

Answer the permutation matrix given by the permutation vector _aSequence_.

A three element permutation vector:

```
>>> [2 3 1].permutationMatrix
[0 1 0; 0 0 1; 1 0 0]
```

A four element permutation vector:

```
>>> [4 1 3 2].permutationMatrix
[
	0 0 0 1;
	1 0 0 0;
	0 0 1 0;
	0 1 0 0
]
```

A seven element permutation vector:

```
>>> [4 5 1 3 2 6 7].permutationMatrix
[
	0 0 0 1 0 0 0;
	0 0 0 0 1 0 0;
	1 0 0 0 0 0 0;
	0 0 1 0 0 0 0;
	0 1 0 0 0 0 0;
	0 0 0 0 0 1 0;
	0 0 0 0 0 0 1
]
```

The determinant is always one:

```
>>> [2 3 1].permutationMatrix.determinant
1
```

The dot product of a permutation matrix _m_ with it’s transpose is the identity matrix:

```
>>> let m = [4 5 1 3 2 6 7].permutationMatrix;
>>> m.dot(m.transposed)
7.identityMatrix
```

* * *

See also: permutationCycles, permutationList, permute

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PermutationMatrix.html)
[2](https://reference.wolfram.com/language/ref/PermutationMatrix.html)
