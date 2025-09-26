# integerCompositionsDo

- _integerCompositionsDo(n, f:/1)_
- _integerCompositionsDo(n, [k…], f:/1)_

An integer composition is an ordered arrangement of _k_ non-negative integers which sum to _n_.
It is therefore a partition in which order is significant.

A positive integer _n_ has _2 ^ (n - 1)_ compositions:

```
>>> let n = 0;
>>> 16.integerCompositionsDo { :unused |
>>> 	n := n + 1
>>> };
>>> n
(2 ^ 15)
```

* * *

See also: integerCompositions
