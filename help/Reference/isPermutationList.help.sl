# isPermutationList

- _isPermutationList(aSequence)_

Answer `true` if _aSequence_ is a valid permutation list, and `false` otherwise.

A valid permutation list of size _n_ is a rearrangement of the integers _1 .. n_.

A valid permutation list:

```
>>> [3 2 6 1 5 4 7 8].isPermutationList
true
```

Invalid permutation lists:

```
>>> [3 2 2 4 1].isPermutationList
false

>>> [0 1 2 3 4].isPermutationList
false
```

The empty list is considered a permutation list of length and degree 0:

```
>>> [].isPermutationList
true
```

A complete `randomSample` of a `Range` from one always gives a valid permutation list:

```
>>> 1:10.randomSample(10).isPermutationList
true
```

`ordering` always returns a permutation list, even if the elements of the expression are repeated:

```
>>> 'aabcbacb'.characters.ordering
[6 2 1 8 5 3 7 4]

>>> [6 2 1 8 5 3 7 4].isPermutationList
true
```

The integers up to 4321 whose decimal digits form permutation lists:

```
>>> 1:4321.select { :each | each.integerDigits.isPermutationList }
[
	1
	12 21
	123 132 213 231 312 321
	1234 1243 1324 1342 1423 1432
	2134 2143 2314 2341 2413 2431
	3124 3142 3214 3241 3412 3421
	4123 4132 4213 4231 4312 4321
]
```

* * *

See also: ordering, permutationList, permutationCycles, isPermutationCycles

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationListQ.html)
