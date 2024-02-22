# wrapBetweenAnd

- _wrapBetweenAnd(aNumber, low, high)_

Wrap an integer between two indices, note that the wrap occurs _before_ the high value is reached:

```
>>> 1:9.collect { :each | each.wrapBetweenAnd(3, 7 + 1) }
[6 7 3 4 5 6 7 3 4]
```

Wrap a float between two values:

```
>>> (0.1, 0.2 .. 0.9).collect { :each | each.wrapBetweenAnd(0.3, 0.7 + 0.1) * 10 }.rounded
[6 7 3 4 5 6 7 3 4]
```

* * *

See also: atFold, atWrap, foldIndex, wrapBetweenAnd, wrapIndex

Categories: Testing
