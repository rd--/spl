# isAlternating

- _isAlternating(l, z)_

Answer `true` is the list _l_ is alternating,
initially ascending or descending according to the sign _z_.

Is alternating, initial step ascending:

```
>>> [1 3 2 4].isAlternating(1)
true
```

Is alternating, initial step descending:

```
>>> [3 1 4 2].isAlternating(-1)
true
```

Alternating permutations of _(1, 2, 3)_, initial step ascending:

```
>>> [1 2 3].permutations
>>> .select { :each |
>>> 	each.isAlternating(1)
>>> }
[1 3 2; 2 3 1]
```

Alternating permutations of _(1, 2, 3, 4)_, initial step ascending:

```
>>> [1 2 3 4].permutations
>>> .select { :each |
>>> 	each.isAlternating(1)
>>> }
[
	1 3 2 4;
	1 4 2 3;
	2 3 1 4;
	2 4 1 3;
	3 4 1 2
]
```

Alternating permutations of _(1, 2, 3, 4)_, initial step descending:

```
>>> [1 2 3 4].permutations
>>> .select { :each |
>>> 	each.isAlternating(-1)
>>> }
[
	2 1 4 3;
	3 2 4 1;
	3 1 4 2;
	4 2 3 1;
	4 1 3 2
]
```

Alternating permutations of _(1, 2, 3, 4, 5)_, initial step ascending:

```
>>> [1 2 3 4 5].permutations
>>> .select { :each |
>>> 	each.isAlternating(1)
>>> }
[
	1 3 2 5 4;
	1 4 3 5 2;
	1 4 2 5 3;
	1 5 3 4 2;
	1 5 2 4 3;
	2 3 1 5 4;
	2 4 3 5 1;
	2 4 1 5 3;
	2 5 3 4 1;
	2 5 1 4 3;
	3 4 1 5 2;
	3 4 2 5 1;
	3 5 1 4 2;
	3 5 2 4 1;
	4 5 1 3 2;
	4 5 2 3 1
]
```

The empty and one-element lists are not alternating:

```
>>> [].isAlternating(1)
false

>>> [1].isAlternating(1)
false
```

* * *

See also: eulerNumber, isMonotonicallyIncreasing, isSortedBy, permutations

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AlternatingPermutation.html),
_W_
[1](https://en.wikipedia.org/wiki/Alternating_permutation)

Further Reading: Stanley 2010
