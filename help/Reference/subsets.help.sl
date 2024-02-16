# subsets

- _subsets(aCollection, aBlock:/1)_

Answer the elements of the power set of _aCollection_ that satisfy the predicate _aBlock_.

All possible subsets containing up to 2 elements:

```
>>> [1 2 3 4].subsets { :each | each.size <= 2 }
[; 1; 2; 1 2; 3; 1 3; 2 3; 4; 1 4; 2 4; 3 4]
```

Subsets containing exactly 2 elements:

```
>>> [1 2 3 4].subsets { :each | each.size = 2 }
[1 2; 1 3; 2 3; 1 4; 2 4; 3 4]
```

All subsets with odd length:

```
>>> [1 2 3 4].subsets { :each | each.size.odd }
[1; 2; 3; 1 2 3; 4; 1 2 4; 1 3 4; 2 3 4]
```

Find all ways to pick 3 elements from 4:

```
>>> [1 2 3 4].subsets { :each | each.size = 3 }
[1 2 3; 1 2 4; 1 3 4; 2 3 4]

>>> 4.binomialCoefficient(3)
4
```

All possible non-empty subsets of the divisors of 10:

```
>>> 10.divisors.subsets  { :each | each.notEmpty }
[1; 2; 1 2; 5; 1 5; 2 5; 1 2 5; 10; 1 10; 2 10; 1 2 10; 5 10; 1 5 10; 2 5 10; 1 2 5 10]
```

Find integers that have exactly 3 nonzero binary digits:

```
>>> [1 2 4 8 16].subsets { :each | each.size = 3 }.collect(sum:/1)
[7 11 13 14 19 21 22 25 26 28]
```

_tuples_ gives all possible combinations and reorderings of elements:

```
>>> [1 2 3].tuples(2)
[1 1; 1 2; 1 3; 2 1 ; 2 2; 2 3; 3 1; 3 2; 3 3]

>>> [1 2 3].subsets { :each | each.size = 2 }
[1 2; 1 3; 2 3]
```

* * *

See also: powerSet, subsets, tuples

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PowerSet.html)
[2](https://reference.wolfram.com/language/ref/Subsets.html)
