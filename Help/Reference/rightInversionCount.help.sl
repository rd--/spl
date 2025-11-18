# rightInversionCount

- _rightInversionCount(p)_

Answer the right inversion count, also called the Lehmer code, of the permutation _p_.

```
>>> [2 1 3].rightInversionCount
[1 0 0]

>>> [3 1 2].rightInversionCount
[2 0 0]
```

The inverse is `rightInversionCountToPermutationList`:

```
>>> [2 1 5 4 3].rightInversionCount
[1 0 2 1 0]

>>> [1 0 2 1 0]
>>> .rightInversionCountToPermutationList
[2 1 5 4 3]
```

Rothe (1800) defines the right inversion count under the name Stellenexponenten,
with each place bigger by 1:

```
>>> [6 4 3 9 8 10 1 7 2 5]
>>> .rightInversionCount
[6 4 3 6 5 5 1 3 1 1] - 1
```

Laisant (1888),
after defining the factorial number system,
defines the right inversion count under the name _signe figuratif_.
For the permutation _4 3 6 5 1 2_ the signe figuratif is given as _(3 2 3 2 0)_:

```
>>> [4 3 6 5 1 2].rightInversionCount
[3 2 3 2 0 0]
```

The right inversion counts of _S3_:

```
>>> [1 2 3]
>>> .lexicographicPermutations
>>> .collect(rightInversionCount:/1)
[0 0 0; 0 1 0; 1 0 0; 1 1 0; 2 0 0; 2 1 0]
```

The right inversion counts of _S4_:

```
>>> [1 2 3 4]
>>> .lexicographicPermutations
>>> .collect(rightInversionCount:/1)
[
	0 0 0 0; 0 0 1 0; 0 1 0 0;
	0 1 1 0; 0 2 0 0; 0 2 1 0;
	1 0 0 0; 1 0 1 0; 1 1 0 0;
	1 1 1 0; 1 2 0 0; 1 2 1 0;
	2 0 0 0; 2 0 1 0; 2 1 0 0;
	2 1 1 0; 2 2 0 0; 2 2 1 0;
	3 0 0 0; 3 0 1 0; 3 1 0 0;
	3 1 1 0; 3 2 0 0; 3 2 1 0
]
```

Interpreted in the factorial number system,
the right inversion count indicates the position of a permutation in the lexicographic ordering,
on the symmetric group to which it belongs:

```
>>> [1 2 4 6 3 5]
>>> .rightInversionCount
>>> .mixedRadixDecode([6 5 4 3 2 1])
10

>>> { :each |
>>> 	each.nextPermutationLexicographic
>>> }.iterate([1 2 3 4 5 6], 10)
[1 2 4 6 3 5]
```

* * *

See also: inversionVector, leftInversionCount

Guides: Permutation Functions

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.to_lehmer_code)

Categories: Permutations
