# reverseAccumulate

- _reverseAccumulate([x₁ x₂ …])_

Accumulate from the right,
also called suffix sum.

Get the sum of elements not to the left of each element in a list:

```
>>> [1 2 3 4].reverseAccumulate
[10 9 7 4]

>>> [2 4 6 8].reverseAccumulate
[20 18 14 8]
```

Nested reverse accumulate:

```
>>> reverseAccumulate:/1.iterate(
>>> 	[1 3 5 7 2],
>>> 	2
>>> )
[60 42 25 11 2]
```

Compute the values of the actuarial commutation function _S_
for a survival list and an annual discount value of 0.8:

```
>>> let a = [100 97 92 86 50 20 9 2 0];
>>> let b = a * (0.8 ^ 0:8);
>>> reverseAccumulate:/1.iterate(b, 2)
[
	769.56 459.24  248.91   116.19 42.34
	 12.53   3.198   0.4194   0
]
```

Written out:

```
>>> [1 2 3 4].reverse.accumulate.reverse
[10 9 7 4]

>>> [1 2 3 4].scanRight(+)
[10 9 7 4]
```

* * *

See also: accumulate, prefixSum, reverse, scanRight

Guides: List Functions
