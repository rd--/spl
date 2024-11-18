# bjorklundsAlgorithmDo

- _bjorklundsAlgorithmDo(k, n, aBlock:/1)_

Apply _aBlock_ at each step of Bjorklund’s algorithm.
The algorithm mutates the same `List` at each step,
to retain use `deepCopy` or `flatten`.

```
>>> let l = [];
>>> 3.bjorklundsAlgorithmDo(8) { :each |
>>> 	l.add(each.flatten)
>>> };
>>> l
[
	1 1 1 0 0 0 0 0;
	1 0 1 0 1 0 0 0;
	1 0 0 1 0 0 1 0
]
```

* * *

See also: bjorklundsAlgorithm, euclideanAlgorithm

Categories: Algorithm, Math
