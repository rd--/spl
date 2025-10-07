# canonicalSort

- _canonicalSort([x₁ x₂ …])_

Sorts a list _xₙ_ into canonical order in place.
Answer the sorted list.
This is `sort` of `canonicalPrecedes`.

Sort subsets canonically:

```
>>> let x = [1 2 3].powerSet;
>>> x.canonicalSort;
>>> x
[; 1; 2; 3; 1 2; 1 3; 2 3; 1 2 3]
```

Order is determined by first by sequence length,
and then by the first element that differs:

```
>>> [2 1 3; 2 1 2 3 4; 2 1 1 3]
>>> .canonicalSort
[2 1 3; 2 1 1 3; 2 1 2 3 4]
```

Empty lists are sorted before any other list:

```
>>> [1 2 3; ; 2 1]
>>> .canonicalSort
[; 2 1; 1 2 3]
```

Sort list of strings:

```
>>> ['a' 'c' 'bx' 'xa']
>>> .canonicalSort
['a' 'c' 'bx' 'xa']
```

Sort matrix of strings:

```
>>> ['c' 'a'; 'bx' 'xa']
>>> .canonicalSort
['bx' 'xa'; 'c' 'a']
```

* * *

See also: lexicographicSort, precedes, sort

Guides: Comparison Functions, Sorting Functions
