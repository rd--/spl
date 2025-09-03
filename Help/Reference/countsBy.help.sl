# countsBy

- _countsBy([e₁ e₂ …], f:/1)_

Answer an association whose keys are the distinct values of _f_ of _e_,
and whose values give the number of times these distinct values appear.

Count the even and odd elements of a list:

```
>>> [1 2 3 2 1 1].countsBy(isEven:/1)
[false: 4, true: 2]
```

Count the prime and composite numbers in a list:

```
>>> [1 .. 1000].countsBy(isPrime:/1)
[false: 832, true: 168]
```

Count elements have the same absolute value:

```
>>> [-1 0 1 0 -1 1].countsBy(abs:/1)
[1: 4, 0: 2]
```

* * *

See also: binCounts, counts, groupBy, tally

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CountsBy.html)
