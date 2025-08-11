# magicSquare

- _magicSquare(n)_

Answer a magic square of the size _n×n_.

A 3×3 magic square:

```
>>> 3.magicSquare
[
	8   1   6;
	3   5   7;
	4   9   2
]
```

A 4×4 magic square:

```
>>> 4.magicSquare
[
	16    2    3   13;
	 5   11   10    8;
	 9    7    6   12;
	 4   14   15    1
]
```

A 5×5 magic square:

```
>>> 5.magicSquare
[
	17   24    1    8   15;
	23    5    7   14   16;
	 4    6   13   20   22;
	10   12   19   21    3;
	11   18   25    2    9
]
```

A 6×6 magic square:

```
>>> 6.magicSquare
[
	35    1    6   26   19   24;
	 3   32    7   21   23   25;
	31    9    2   22   27   20;
	 8   28   33   17   10   15;
	30    5   34   12   14   16;
	 4   36   29   13   18   11
]
```

A 7×7 magic square:

```
>>> 7.magicSquare
[
	30   39   48    1   10   19   28;
	38   47    7    9   18   27   29;
	46    6    8   17   26   35   37;
	 5   14   16   25   34   36   45;
	13   15   24   33   42   44    4;
	21   23   32   41   43    3   12;
	22   31   40   49    2   11   20
]
```

An 8×8 magic square:

```
>>> 8.magicSquare
[
	64    2    3   61   60    6    7   57;
	 9   55   54   12   13   51   50   16;
	17   47   46   20   21   43   42   24;
	40   26   27   37   36   30   31   33;
	32   34   35   29   28   38   39   25;
	41   23   22   44   45   19   18   48;
	49   15   14   52   53   11   10   56;
	 8   58   59    5    4   62   63    1
]
```

A 10×10 magic square:

```
>>> 10.magicSquare.magicSquareSummary
(
	sum: 505,
	rowSums: 505 # 10,
	columnSums: 505 # 10,
	diagonalSum: 505,
	anitdiagonalSum: 505,
	rank: 7
)
```

* * *

See also: List, magicSquareSummary, Matrix

Guides: Magic Squares

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/magic.html)
