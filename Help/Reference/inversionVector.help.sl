# inversionVector

- _inversionVector(aPermutation)_

Answer the inversion vector of _aPermutation_.

The inversion vector of a permutation indicates for each place the number of elements larger than it that appear to its left.

```
>>> [5 9 1 8 2 6 4 7 3].inversionVector
[2 3 6 4 0 2 2 1 0]

>>> [8 7 2 1 9 4 6 5 10 3].inversionVector
[3 2 7 3 4 3 1 0 0 0]

>>> [3 2 4 1 5].inversionVector
[3 1 0 0 0]

>>> [6 2 1 3 4 5 8 7 9].inversionVector
[2 1 1 1 1 0 1 0 0]
```

The inversion vectors of _S4_:

```
>>> [1 .. 4]
>>> .lexicographicPermutations
>>> .collect(inversionVector:/1)
[
	0 0 0 0; 0 0 1 0; 0 1 0 0;
	0 2 0 0; 0 1 1 0; 0 2 1 0;
	1 0 0 0; 1 0 1 0; 2 0 0 0;
	3 0 0 0; 2 0 1 0; 3 0 1 0;
	1 1 0 0; 1 2 0 0; 2 1 0 0;
	3 1 0 0; 2 2 0 0; 3 2 0 0;
	1 1 1 0; 1 2 1 0; 2 1 1 0;
	3 1 1 0; 2 2 1 0; 3 2 1 0
]
```

* * *

See also: leftInversionCount, Permutation, permutationInversions, permutationSymbol

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InversionVector.html),
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.to_inversion_vector),
_W_
[1](https://en.wikipedia.org/wiki/Inversion_(discrete_mathematics)#Inversion_related_vectors)

Categories: Permutations
