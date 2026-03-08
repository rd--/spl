# cube

- _cube(x)_

Answer the number _x_ raised to the power of three.

```
>>> (3 * 3 * 3, 3 ^ 3, 3.cube)
(27, 27, 27)
```

The inverse is `cubeRoot`:

```
>>> 3.cube.cubeRoot
3
```

First few terms,
threads over lists,
OEIS [A000578](https://oeis.org/A000578):

```
>>> 0:9.cube
[0 1 8 27 64 125 216 343 512 729]
```

Partial sums,
also _n_-th triangular number squared,
OEIS [A000537](https://oeis.org/A000537):

```
>>> 0:9.cube.prefixSum
[0 1 9 36 100 225 441 784 1296 2025]

>>> 0:9.triangularNumber.square
[0 1 9 36 100 225 441 784 1296 2025]
```

Where supported `cube` is displayed as ³.

* * *

See also: ^, *, cubeRoot, square

Unicode: U+00B3 ³ Superscript Three
