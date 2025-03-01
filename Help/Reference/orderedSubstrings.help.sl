# orderedSubstrings

- _orderedSubstrings(aSequence, aBlock:/2)_

Answer a `List` of the substrings of _aSequence_ that are ordered according to _aBlock_.
The `catenate` of the answer will compare equal, according to `hasEqualElements`, with _aSequence_

```
>>> [1 3 5 4 3 2 3 2 1].orderedSubstrings(>)
[1; 3; 5 4 3 2; 3 2 1]
```

The unary case compares using `<`:

```
>>> [1 2 3 2 3 4 3 4 5].orderedSubstrings
[1 2 3; 2 3 4; 3 4 5]
```

The ordered substrings of a permutation are called `permutationRuns`:

```
>>> [1 3 2 5 4].permutationRuns
[1 3; 2 5; 4]
```

* * *

See also: <, catenate, hasEqualElements, permutationRuns, substrings

Categories: Enumerating, Math
