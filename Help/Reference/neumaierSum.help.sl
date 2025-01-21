# neumaierSum

- _neumaierSum(anIterable)_

Answer the `sum` of _anIterable_ calculated using Neumaier’s variant of the _Kahan summation algorithm_.

```
>>> let l = [1 1E20 1 -1E20];
>>> (l.sum, l.neumaierSum)
(0, 2)
```

* * *

See also: +, pairwiseSum, sum

References:
_W_
[1](https://en.wikipedia.org/wiki/Kahan_summation_algorithm)

Further Reading: Neumaier 1974
