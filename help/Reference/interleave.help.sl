# interleave

- _interleave(aSequence, anotherSequence)_

Answer a `List` that has, alternately, the elements of _aSequence_ and _anotherSequence_

```
>>> [3 4 5].interleave([0 1 2])
[3 0 4 1 5 2]
```

The shorter sequence is cycled as required:

```
>>> [3 4 5].interleave([1 2])
[3 1 4 2 5 1]

>>> [3 4].interleave([0 1 2])
[3 0 4 1 3 2]
```

Alternate positive and negative integers:

```
>>> 1:10.interleave(-1:-10)
[1 -1 2 -2 3 -3 4 -4 5 -5 6 -6 7 -7 8 -8 9 -9 10 -10]
```

* * *

See also: intercalate, intersperse, transposed

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Riffle.html)
