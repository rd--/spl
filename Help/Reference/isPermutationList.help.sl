# isPermutationList

- _isPermutationList(aSequence)_

Answer `true` if _aSequence_ is a valid permutation list, and `false` otherwise.

A valid permutation list of size _n_ is a rearrangement of the integers _1 .. n_.

A valid permutation list:

```
>>> [3 2 6 1 5 4 7 8].isPermutationList
true
```

A permutation lists must not contain duplicates:

```
>>> [3 2 2 4 1].isPermutationList
false
```

A permutation lists must not contain non-positive integers:

```
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
>>> system.randomSample(1:10, 10)
>>> .isPermutationList
true
```

`ordering` always returns a permutation list, even if the elements of the expression are repeated:

```
>>> let p = 'aabcbacb'.contents.ordering;
>>> (p, p.isPermutationList)
([6 2 1 8 5 3 7 4], true)
```

The integers up to 4321 whose decimal digits form permutation lists:

```
>>> 1:4321.select { :each |
>>> 	each.integerDigits.isPermutationList
>>> }
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

The support of a permutation list is the list of points not at their natural positions:

```
>>> let p = [5 2 3 6 1 7 4 8 9 10];
>>> p.permutationSupport
[1 4 5 6 7]
```

Conversion to cyclic form:

```
>>> let p = [
>>> 	01 24 21  4 17  5 13 26  2 10
>>> 	27  9 14  3 22 29 28 23 25 18
>>> 	06 15 11 20 19  8  7 12 16 30
>>> ];
>>> p.permutationCycles
[
	2 24 20 18 23 11 27 7 13 14 3 21 6 5 17 28 12 9;
	8 26;
	15 22;
	16 29;
	19 25
]
```

Product of two permutation lists of the same length:

```
>>> let p = [9 10 3 7 4 8 5 2 1 6];
>>> let q = [3 2 4 10 9 5 7 6 8 1];
>>> let r = [p, q].permutationProduct;
>>> r.list
[8 1 4 7 10 6 9 2 3 5]
```

* * *

See also: ordering, permutationList, permutationCycles, isPermutationCycles

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationListQ.html)

Categories: Permutations, Testing
