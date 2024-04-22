# bjorklundsAlgorithm

- _bjorklundsAlgorithm(k, n)_

Bjorklund’s algorithm to construct a binary sequence of _n_ bits with _k_ ones,
such that the _k_ ones are distributed as evenly as possible among the _n - k_ zeroes.

```
>>> 3.bjorklundsAlgorithm(8)
[1 0 0 1 0 0 1 0]

>>> 5.bjorklundsAlgorithm(13)
[1 0 0 1 0 1 0 0 1 0 1 0 0]
```

* * *

See also: bjorklundsAlgorithmDo, euclideanAlgorithm

Further Reading: Bjorklund 1989, Demaine 2005
