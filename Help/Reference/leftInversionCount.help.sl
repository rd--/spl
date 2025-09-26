# leftInversionCount

- _leftInversionCount(p)_

Answer the left inversion count, also called the Lehmer co-code, of the permutation _p_.

```
>>> [2 1 3].leftInversionCount
[0 1 0]

>>> [3 1 2].leftInversionCount
[0 1 1]

>>> [4 6 2 5 1 3].leftInversionCount.sum
10
```

The left inversion counts of _S3_:

```
>>> [1 .. 3]
>>> .lexicographicPermutations
>>> .collect(leftInversionCount:/1)
[0 0 0; 0 0 1; 0 1 0; 0 0 2; 0 1 1; 0 1 2]
```

The left inversion counts of _S4_:

```
>>> [1 .. 4]
>>> .lexicographicPermutations
>>> .collect(leftInversionCount:/1)
[
	0 0 0 0; 0 0 0 1; 0 0 1 0;
	0 0 0 2; 0 0 1 1; 0 0 1 2;
	0 1 0 0; 0 1 0 1; 0 0 2 0;
	0 0 0 3; 0 0 2 1; 0 0 1 3;
	0 1 1 0; 0 1 0 2; 0 1 2 0;
	0 1 0 3; 0 0 2 2; 0 0 2 3;
	0 1 1 1; 0 1 1 2; 0 1 2 1;
	0 1 1 3; 0 1 2 2; 0 1 2 3
]
```

* * *

See also: inversionVector, rightInversionCount

Guides: Permutation Functions

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.to_lehmer_cocode)

Categories: Permutations
