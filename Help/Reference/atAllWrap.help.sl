# atAllWrap

- _atAllWrap(aSequence, anotherSequence)_

Answer the elements at each item of _anotherSequence_ in _aSequence_.
If any _index_ is out of bounds, let it wrap around from the end to the beginning until it is in bounds.

```
>>> 1:5.atAllWrap(-1:9)
[4 5 1 2 3 4 5 1 2 3 4]
```

* * *

See also: at, atAll, atFold, atPin, atPutWrap

Categories: Acccessing
