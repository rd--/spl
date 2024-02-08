# rank

_rank(aNumber | aList)_

In the Apl array model, the rank of an array is the number of dimensions or axes in its structure, or the length of its shape.

Arrays are given names based on their rank.
A rank zero array is a scalar,
a rank one aray is a vector,
a rank two aray is a matrix.

```
>>> 1.rank
0

>>> [1 2 3 4 5 6 7 8].rank
1

>>> [1 2 3 4; 5 6 7 8].rank
2

>>> [[1 2; 3 4] [5 6; 7 8]].rank
3
```

* * *

See also: List, shape

References:
_Apl_
[1](https://aplwiki.com/wiki/Rank)
[2](https://aplwiki.com/wiki/Rank_(operator))

