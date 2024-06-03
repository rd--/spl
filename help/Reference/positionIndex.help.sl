# positionIndex

- _positionIndex(aSequence)_

Answer a `Map` between unique (according to `==`) items in _aSequence_ and the positions at which they occur.

Find positions of items in a `List`:

```
>>> 'abcaca'.contents.positionIndex
['a' -> [1 4 6], 'b' -> [2], 'c' -> [3 5]].asMap
```

* * *

See also: deleteDuplicates, tally

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PositionIndex.html)
