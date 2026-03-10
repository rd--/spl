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

First few cubic numbers,
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

Rational numbers whose cubes sum to six and nine:

```
>>> 17/21.cube + 37/21.cube
6

>>> 415280564497/348671682660.cube
>>> +
>>> 676702467503/348671682660.cube
9

>>> 1.cube + 2.cube
9
```

Every positive integer can be written as the sum of nine or fewer positive cubes:

```
>>> [2 2 1 1 1 1 1 1 1].cube.sum
23
```

Cubes are sums of successive odd integers:

```
>>> [1, 3 .. 41].splitPlaces([1 .. 6])
>>> .collect(sum:/1)
[1 8 27 64 125 216]

>>> [1 2 3 4 5 6].cube
[1 8 27 64 125 216]

>>> [1, 3 .. 41].splitPlaces([1 .. 6])
[
	1;
	3 5;
	7 9 11;
	13 15 17 19;
	21 23 25 27 29;
	31 33 35 37 39 41
]
```

Binary expansion of cubic numbers,
matrix plot,
OEIS [A000578](https://oeis.org/A000578):

~~~spl svg=A
0:63.cube
.binaryExpansion
.padLeft
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/cube-A.svg)

Cubic numbers,
OEIS [A000578](https://oeis.org/A000578):

~~~spl svg=B
0:65.cube.discretePlot
~~~

![](sw/spl/Help/Image/cube-B.svg)

_x³_ plotted on a Cartesian plane:

~~~spl svg=C
(-2 -- 2).functionPlot(cube:/1)
~~~

![](sw/spl/Help/Image/cube-C.svg)

Where supported `cube` is displayed as ³.

* * *

See also: ^, *, cubeRoot, square

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CubicNumber.html),
_W_
[1](https://en.wikipedia.org/wiki/Cube_(algebra))

Unicode: U+00B3 ³ Superscript Three
