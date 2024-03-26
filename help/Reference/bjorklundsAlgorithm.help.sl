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

References:
E. Bjorklund, 2003, _The theory of rep-rate pattern generation in the SNS timing system_,
SNS ASD Technical Note, Los Alamos Laboratory.
