# orderedSubstrings

- _orderedSubstrings(u, f:/2)_

Answer a `List` of the substrings of the sequence _u_ that are ordered according to the binary block _f_.
The `catenate` of the answer will compare equal, according to `hasEqualElements`, with _u_

```
>>> [1 3 5 4 3 2 3 2 1]
>>> .orderedSubstrings(>)
[1; 3; 5 4 3 2; 3 2 1]
```

The unary case compares using `<|`:

```
>>> [1 2 3 2 3 4 3 4 5]
>>> .orderedSubstrings
[1 2 3; 2 3 4; 3 4 5]
```

The ordered substrings of a permutation are called `permutationRuns`:

```
>>> [1 3 2 5 4].permutationRuns
[1 3; 2 5; 4]
```

* * *

See also: <, catenate, hasEqualElements, permutationRuns, substrings

Guides: List Functions, Permutation Functions

Categories: Enumerating, Math
