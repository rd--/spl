# ranking

- _ranking([n₁ n₂ …], method)_

Finds the rank of each of the items _n_.
Ranking is the transformation in which numerical or ordinal values are replaced by their rank when the data are sorted.
Method are 'Ordinal' and 'Fractional'.

Find ordinal ranks for lists without repeated items:

```
>>> [3.4 5.1 2.6 7.3].ranking('Ordinal')
[2 3 1 4]

>>> [14 312 0 3 1].ranking('Ordinal')
[4 5 1 3 2]

>>> [3 1 4 15 92].ranking('Ordinal')
[2 1 3 4 5]

>>> [3 -4 1 4 22 17 -2 2 13 -11]
>>> .ranking('Ordinal')
[6 2 4 7 10 9 3 5 8 1]
```

Ordinal ranking, tied elements are assigned distinct ordinal ranks:

```
>>> [0 2 3 2].ranking('Ordinal')
[1 2 4 3]

>>> [1 1 2 3 3 4 5 5 5].ranking('Ordinal')
[1 2 3 4 5 6 7 8 9]

```

Fractional ranking, tied elements are assigned shared fractional ranks:

```
>>> [0 2 3 2].ranking('Fractional')
[1 2.5 4 2.5]

>>> [1 1 2 3 3 4 5 5 5]
>>> .ranking('Fractional')
[1.5 1.5 3 4.5 4.5 6 8 8 8]
```

Ordinal ranking is the `ordering` of the `ordering`:

```
>>> [14 312 0 3 1].ranking('Ordinal')
[4 5 1 3 2]

>>> [14 312 0 3 1].ordering.ordering
[4 5 1 3 2]
```

* * *

See also: ordering, sort

Guides: Sort Functions, Statistics Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StatisticalRank.html)
[2](https://resources.wolframcloud.com/FunctionRepository/resources/Ranking/),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.rankdata.html),
_R_
[1](https://stat.ethz.ch/R-manual/R-devel/library/base/html/rank.html),
_W_
[1](https://en.wikipedia.org/wiki/Ranking_(statistics))
