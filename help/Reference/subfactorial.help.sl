# subfactorial

_subfactorial(anInteger)_

Answers the number of permutations of _anInteger_ objects that leave no object fixed.

A permutation in which no object appears in its natural place is called a derangement.
The subfactorial counts the number of derangements.

```
>>> 6.subfactorial
265

>>> 1:9.collect(subfactorial:/1)
[0 1 2 9 44 265 1854 14833 133496]
```

Plot the values on a log scale over a subset of the reals:

```
2:12.collect(subfactorial:/1).log.plot
```

* * *

See also: factorial

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Subfactorial.html)
[2](https://reference.wolfram.com/language/ref/Subfactorial.html)
