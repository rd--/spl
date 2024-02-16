# integerCompositionsWeak

- _integerCompositions(n, k)_

A weak composition is an ordered arrangement of _k_ non-negative integers which sum to _n_.
It is therefore a partition in which order is significant.


>>> 5.integerCompositionsWeak(3)
[0 0 5; 0 1 4; 0 2 3; 0 3 2; 0 4 1; 0 5 0; 1 0 4; 1 1 3; 1 2 2; 1 3 1; 1 4 0; 2 0 3; 2 1 2; 2 2 1; 2 3 0; 3 0 2; 3 1 1; 3 2 0; 4 0 1; 4 1 0; 5 0 0]

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
