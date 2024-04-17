# detectStartingAt

- _detectStartingAt(aSequence, aBlock:/1, anInteger)_

Like `detect` but begin at index _anInteger_ instead of `one`.

```
>>> 1:6.detectStartingAt(isEven:/1, 3)
4

>>> 1:6.detect(isEven:/1)
2
```

* * *

See also: detect
