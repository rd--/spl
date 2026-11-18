# neumaierSum

- _neumaierSum([n₁ n₂ …])_

Answer the `sum` of _n_ calculated using Neumaier’s variant of the _Kahan summation algorithm_,
also known as compensated summation.

```
>>> let l = [1.0 1.0E20 1.0 -1.0E20];
>>> (l.sum, l.neumaierSum)
(0.0, 2.0)
```

* * *

See also: +, pairwiseSum, sum

References:
_W_
[1](https://en.wikipedia.org/wiki/Kahan_summation_algorithm)

Further Reading: Neumaier 1974
