# rotatedLeft

- _rotatedLeft(aSequence)_
- _rotatedLeft(aSequence, anInteger)_

Rotate _aSequence_ by _anInteger_ places to the left,
i.e. _anInteger_ elements from the start are moved to the end.
The rotation is not in place, a new sequence is answered.

```
>>> 0:5.rotatedLeft(2)
[2 3 4 5 0 1]

>>> [1 2 3 4 5 6 7].rotatedLeft(3)
[4 5 6 7 1 2 3]

>>> [1 2 3 4 5 6 7].rotatedLeft(8)
[2 3 4 5 6 7 1]

>>> [1 2 3 4 5 6 7].rotatedLeft(-4)
[4 5 6 7 1 2 3]
```

Rotate matrix:

```
>>> 0:9.reshape([5 2]).rotatedLeft(2)
[4 5; 6 7; 8 9; 0 1; 2 3]
```

The unary form rotates by one place:

```
>>> [1 2 3 4 5 6 7].rotatedLeft
[2 3 4 5 6 7 1]
```

* * *

See also: atWrap, rotatedRight

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bardot#dyadic)
