# pisotSequence

- _pisotSequence(k, x, y, n)_

Answer the first _n_ terms of the Pisot sequence _K(x,y)_.

Pisot sequences _(2,6)_,
OEIS [A008776](https://oeis.org/A008776):

```
>>> pisotSequence('E', 2, 6, 10)
[2 6 18 54 162 486 1458 4374 13122 39366]

>>> pisotSequence('L', 2, 6, 10)
[2 6 18 54 162 486 1458 4374 13122 39366]

>>> pisotSequence('P', 2, 6, 10)
[2 6 18 54 162 486 1458 4374 13122 39366]

>>> pisotSequence('T', 2, 6, 10)
[2 6 18 54 162 486 1458 4374 13122 39366]
```

Pisot sequences _(4,8)_,
OEIS [A008776](https://oeis.org/A008776):

```
>>> pisotSequence('P', 4, 8, 11)
[4 8 16 32 64 128 256 512 1024 2048 4096]
```

Pisot sequence _T(5,21)_,
OEIS [A010925](https://oeis.org/A010925):

```
>>> pisotSequence('T', 5, 21, 8)
[5 21 88 368 1538 6427 26857 112229]

>>> pisotSequence('T', 5L, 21, 27).last
70795240417122019L
```

Pisot sequence _E(3,5)_,
OEIS [A020701](https://oeis.org/A020701):

```
>>> pisotSequence('E', 3, 5, 13)
[3 5 8 13 21 34 55 89 144 233 377 610 987]
```

Pisot sequence _P(4,11)_,
OEIS [A021006](https://oeis.org/A021006):

```
>>> pisotSequence('P', 4, 11, 10)
[4 11 30 82 224 612 1672 4568 12480 34096]
```

Pisot sequence _L(5,9)_
OEIS [A020737](https://oeis.org/A020737):

```
>>> pisotSequence('L', 5, 9, 11)
[5 9 17 33 65 129 257 513 1025 2049 4097]
```

* * *

See also: power, recurrenceTable

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PisotNumber.html),
_W_
[1](https://en.wikipedia.org/wiki/Pisot%E2%80%93Vijayaraghavan_number),

Guides: Integer Sequence Functions

Further Reading: Boyd 1979
