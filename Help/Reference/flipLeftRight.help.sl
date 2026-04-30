# flipLeftRight

- _flipLeftRight(a)_

Flip the array _a_ left to right.

Of a vector:

```
>>> [1 2 3 4 5 6 7 8 9].flipLeftRight
[9 8 7 6 5 4 3 2 1]

>>> [1 2 3 4 5 6 7 8 9]
>>> .flipLeftRight
>>> .flipLeftRight
[1 2 3 4 5 6 7 8 9]
```

Of a matrix:

```
>>> [1 2; 3 4].flipLeftRight
[2 1; 4 3]

>>> [1 2 3; 4 5 6; 7 8 9].flipLeftRight
[3 2 1; 6 5 4; 9 8 7]

>>> [1 2 3; 4 5 6; 7 8 9]
>>> .flipLeftRight
>>> .flipLeftRight
[1 2 3; 4 5 6; 7 8 9]
```

Of a volume:

```
>>> [1 2; 3 4:; 5 6; 7 8].flipLeftRight
[2 1; 4 3:; 6 5; 8 7]

>>> [1 2; 3 4:; 5 6; 7 8]
>>> .flipLeftRight
>>> .flipLeftRight
[1 2; 3 4:; 5 6; 7 8]
```

To flip a matrix in the up-down direction use `reverse`:

```
>>> [1 2; 3 4].reverse
[3 4; 1 2]

>>> [1; 2; 3; 4].reverse
[4; 3; 2; 1]
```

* * *

See also: reverse, transpose

Guides: Array Functions, Matrix Functions

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/fliplr.html)
