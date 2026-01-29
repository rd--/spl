# isSuperpermutation

- _isSuperpermutation(p)_

Answer `true` if _p_ is a superpermutation,
a string that contains each permutation of _n_ symbols as a substring.

The first four smallest superpermutations,
OEIS [A332089](https://oeis.org/A332089):

```
>>> [1].isSuperpermutation
true

>>> [1 2 1].isSuperpermutation
true

>>> [1 2 3 1 2 1 3 2 1].isSuperpermutation
true

>>> [
>>> 	1 2 3 4 1 2 3 1 4 2 3 1 2 4 3 1 2 1 3 4
>>> 	2 1 3 2 4 1 3 2 1 4 3 2 1
>>> ].isSuperpermutation
true
```

One of several smallest superpermutations for _n=5_:

```
>>> [
>>> 	1 2 3 4 5 1 2 3 4 1 5 2 3 4 1 2 5 3 4 1
>>> 	2 3 5 4 1 2 3 1 4 5 2 3 1 4 2 5 3 1 4 2
>>> 	3 5 1 4 2 3 1 5 4 2 3 1 2 4 5 3 1 2 4 3
>>> 	5 1 2 4 3 1 5 2 4 3 1 2 5 4 3 1 2 1 3 4
>>> 	5 2 1 3 4 2 5 1 3 4 2 1 5 3 4 2 1 3 5 4
>>> 	2 1 3 2 4 5 1 3 2 4 1 5 3 2 4 1 3 5 2 4
>>> 	1 3 2 5 4 1 3 2 1 4 5 3 2 1 4 3 5 2 1 4
>>> 	3 2 5 1 4 3 2 1 5 4 3 2 1
>>> ].isSuperpermutation
true
```

* * *

See also: allSatisfy, includesSubstring, permutations

Guides: Permutation Functions

References:
_OEIS_
[1](https://oeis.org/A332089),
_W_
[1](https://en.wikipedia.org/wiki/Superpermutation)
