# rotateRight

- _rotateRight([x₁ x₂ …], n=1)_

Rotate the sequence _x_ by _n_ places to the right,
i.e. _n_ elements from the end are moved to the start.
The rotation is not in place, a new sequence is answered.

Rotate right by three places:

```
>>> 1:7.rotateRight(3)
[5 6 7 1 2 3 4]
```

Rotate left by four places:

```
>>> 1:7.rotateRight(-4)
[5 6 7 1 2 3 4]
```

Rotating evenly and oddly sized vectors left and right by half of the size:

```
>>> 1:6.rotateRight(6 // 2)
[4 5 6 1 2 3]

>>> 1:6.rotateLeft(6 // 2)
[4 5 6 1 2 3]

>>> 1:7.rotateRight(7 // 2)
[5 6 7 1 2 3 4]

>>> 1:7.rotateLeft(7 // 2)
[4 5 6 7 1 2 3]
```

* * *

See also: atWrap, rotateLeft

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RotateRight.html)

Categories: Ordering
