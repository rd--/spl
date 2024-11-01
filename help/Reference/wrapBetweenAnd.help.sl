# wrapBetweenAnd

- _wrapBetweenAnd(aNumber, low, high)_

Wrap _aNumber_ so that it lies between _low_ and _high_.
Threads elementise over lists.

Wrap between two integer indices, note that the wrap occurs _before_ the high value is reached:

```
>>> 1:9.wrapBetweenAnd(3, 7 + 1)
[6 7 3 4 5 6 7 3 4]
```

Wrap a real number between two values:

```
>>> let w = (0.1, 0.2 .. 0.9).wrapBetweenAnd(0.3, 0.7 + 0.1);
>>> (w * 10).rounded
[6 7 3 4 5 6 7 3 4]
```

* * *

See also: atFold, atWrap, foldIndex, wrapBetweenAnd, wrapIndex

Categories: Testing
