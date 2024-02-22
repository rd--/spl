# LsScan

- _LsScan(input, aBlock:/2)_

A stream that accumulates the succesive applications of _aBlock_ to the elements of _input_.
Can be used to calculate the prefix sum and product.

```
>>> LsScan(LsSeries(1, 1, 9), +).upToEnd
[1 3 6 10 15 21 28 36 45]

>>> LsScan(LsSeries(1, 1, 9), *).upToEnd
[1 2 6 24 120 720 5040 40320 362880]

>>> LsScan(LsSeries(1, 1, 9), -).upToEnd
[1 -1 -4 -8 -13 -19 -26 -34 -43]
```

* * *

See also: LsAccum, LsFold
