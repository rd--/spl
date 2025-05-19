# rotatedRight

- _rotatedRight(aSequence, anInteger)_

Rotate _aSequence_ by _anInteger_ places to the right,
i.e. _anInteger_ elements from the end are moved to the start.
The rotation is not in place, a new sequence is answered.

Rotate right by three places:

```
>>> 1:7.rotatedRight(3)
[5 6 7 1 2 3 4]
```

Rotate left by four places:

```
>>> 1:7.rotatedRight(-4)
[5 6 7 1 2 3 4]
```

Rotating evenly and oddly sized vectors left and right by half of the size:

```
>>> 1:6.rotatedRight(6 // 2)
[4 5 6 1 2 3]

>>> 1:6.rotatedLeft(6 // 2)
[4 5 6 1 2 3]

>>> 1:7.rotatedRight(7 // 2)
[5 6 7 1 2 3 4]

>>> 1:7.rotatedLeft(7 // 2)
[4 5 6 7 1 2 3]
```

* * *

See also: atWrap, rotatedLeft

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RotateRight.html)

Categories: Ordering
