# powerSet

- _powerSet(alpha)_ => _subsets(alpha, true.constant)_

Answer the elements of the power set of _aCollection_.

All subsets of _[1 2 3]_, including the empty set:

```
>>> [1 2 3].powerSet
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3]
```

Different occurrences of the same element are treated as distinct:

```
>>> [1 1].powerSet
[; 1; 1; 1 1]
```

* * *

See also: powerSetDo, subsets, tuples

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PowerSet.html)
[2](https://reference.wolfram.com/language/ref/Subsets.html)
