# subsets

- _subsets(aCollection, aBlock:/1)_

Answer the elements of the power set of _aCollection_ that satisfy the predicate _aBlock_.

All possible subsets containing up to 2 elements:

```
>>> [1 2 3 4].subsets { :each |
>>> 	each.size <= 2
>>> }
[; 1; 2; 1 2; 3; 1 3; 2 3; 4; 1 4; 2 4; 3 4]
```

Subsets containing exactly 2 elements:

```
>>> [1 2 3 4].subsets { :each | each.size = 2 }
[1 2; 1 3; 2 3; 1 4; 2 4; 3 4]
```

All subsets with odd length:

```
>>> [1 2 3 4].subsets { :each | each.size.isOdd }
[1; 2; 3; 1 2 3; 4; 1 2 4; 1 3 4; 2 3 4]
```

Find all ways to pick 3 elements from 4:

```
>>> [1 2 3 4].subsets { :each | each.size = 3 }
[1 2 3; 1 2 4; 1 3 4; 2 3 4]

>>> 4.binomial(3)
4
```

All possible non-empty subsets of the divisors of 10:

```
>>> 10.divisors.subsets  { :each | each.notEmpty }
[
	1; 2; 1 2;
	5; 1 5; 2 5; 1 2 5;
	10; 1 10; 2 10; 1 2 10; 5 10; 1 5 10; 2 5 10; 1 2 5 10
]
```

Find integers that have exactly 3 nonzero binary digits:

```
>>> [1 2 4 8 16].subsets { :each | each.size = 3 }.collect(sum:/1)
[7 11 13 14 19 21 22 25 26 28]
```

`tuples` gives all possible combinations and reorderings of elements:

```
>>> [1 2 3].tuples(2)
[1 1; 1 2; 1 3; 2 1; 2 2; 2 3; 3 1; 3 2; 3 3]

>>> [1 2 3].subsets { :each | each.size = 2 }
[1 2; 1 3; 2 3]
```

Construct the _Petersen_ graph as the third _Odd Graph_.
The _n_-th Odd Graph has as vertices the _n-1_-element subsets of _1 .. 2*n-1_,
and an edge between two vertices if their corresponding sets are disjoint:

```
>>> let v = 1:5.subsets { :each | each.size = 2 };
>>> v.collect { :i |
>>> 	i -> v.select { :j |
>>> 		i.precedes(j) & { i.isDisjoint(j) }
>>> 	}
>>> }.select { :each | each.value.notEmpty }
[
	[1 2] -> [3 4; 3 5; 4 5],
	[1 3] -> [2 4; 2 5; 4 5],
	[2 3] -> [[4, 5]],
	[1 4] -> [2 3; 2 5; 3 5],
	[2 4] -> [[3, 5]],
	[1 5] -> [2 3; 2 4; 3 4],
	[2 5] -> [[3, 4]]
]
```

* * *

See also: combinationsAtATimeDo, powerSet, tuples

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PowerSet.html)
[2](https://reference.wolfram.com/language/ref/Subsets.html)
