# integerCompositions

- _integerCompositions(n, k)_
- _integerCompositions(n)_

A composition is an ordered arrangement of _k_ positive integers which sum to _n_.
It is therefore a partition in which order is significant.

There are eight compositions of 4:

```
>>> 4.integerCompositions
[4; 1 3; 2 2; 3 1; 1 1 2; 1 2 1; 2 1 1; 1 1 1 1]
```

The compositions of 1, 2, 3 & 5:

```
>>> 1.integerCompositions
[[1]]

>>> 2.integerCompositions
[2; 1 1]

>>> 3.integerCompositions
[3; 1 2; 2 1; 1 1 1]

>>> 5.integerCompositions.allButLast
[5; 1 4; 2 3; 3 2; 4 1; 1 1 3; 1 2 2; 1 3 1; 2 1 2; 2 2 1; 3 1 1; 1 1 1 2; 1 1 2 1; 1 2 1 1; 2 1 1 1]
```

A positive integer _n_ has _2 ^ (n - 1)_ compositions:

```
>>> 9.integerCompositions.size
(2 ^ 8)
```

* * *

See also: integerCompositionsDo, integerPartitions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Composition.html)
