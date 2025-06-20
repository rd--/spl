# lexicographicSort

- _lexicographicSort([x₁ x₂ …])_

Sorts a list _xₙ_ into lexicographic order in place.
Answer the sorted list.
This is `sort` of `precedes`.

Sort subsets lexicographically:

```
>>> let x = [1 2 3].powerSet;
>>> x.lexicographicSort;
>>> x
[; 1; 1 2; 1 2 3; 1 3; 2; 2 3; 3]
```

Order is determined by the first element that differs, regardless of expression length:

```
>>> [2 1 3; 2 1 2 3 4; 2 1 1 3]
>>> .lexicographicSort
[2 1 1 3; 2 1 2 3 4; 2 1 3]
```

When all elements coincide up to the shortest length, shorter lists are ordered first:

```
>>> [1 2 3 4; 1; 1 2 3; 1 2]
>>> .lexicographicSort
[1; 1 2; 1 2 3; 1 2 3 4]
```

Empty lists are sorted before any other list:

```
>>> [1 2 3; ; 2 1]
>>> .lexicographicSort
[; 1 2 3; 2 1]
```

* * *

See also: precedes, sort

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LexicographicSort.html)
