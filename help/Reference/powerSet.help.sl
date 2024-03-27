# powerSet

- _powerSet(alpha)_

Answer a `List` of the elements of the power set of _aCollection_.

All subsets of the `List` _[1 2 3]_, including the empty set:

```
>>> [1 2 3].powerSet
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3]
```

At `List`, different occurrences of the same element are treated as distinct:

```
>>> [1 1].powerSet
[; 1; 1; 1 1]
```

At `Set`:

```
>>> [1 2 3].asSet.powerSet
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3].collect(asSet:/1)
```

* * *

See also: powerSetDo, subsets, tuples

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PowerSet.html)
[2](https://reference.wolfram.com/language/ref/Subsets.html)

Categories: Set Operations
