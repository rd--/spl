# isSquare

- _isSquare(n)_

Answer `true` if the integer _n_ is a square number.

Square numbers,
OEIS [A000290](https://oeis.org/A000290):

```
>>> 0L:99.select(isSquare/1)
[0 1 4 9 16 25 36 49 64 81]

>>> 0L:9 ^ 2
[0 1 4 9 16 25 36 49 64 81]
```

At `SmallFloat`:

```
>>> 81.isSquare
true

>>> 0:99.select(isSquare/1)
[0 1 4 9 16 25 36 49 64 81]
```

`one` if _n_ is of the form _m(m+3)/2_,
OEIS [A023531](https://oeis.org/A023531):

```
>>> 0:20.collect { :n |
>>> 	(8 * n + 9).isSquare.boole
>>> }
[1 0 1 0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0 0 1]
```

OEIS [A023531](https://oeis.org/A023531)
is the turn sequence of the triangle spiral:

~~~spl svg=A
0:103.collect { :n |
	(8 * n + 9).isSquare.boole * 120.degree
}.anglePath.Line
~~~

![](Help/Image/isSquare-A.svg)

* * *

See also: isInteger, isIntegerSquare, square, sqrt

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquareNumber.html),
_OEIS_
[1](https://oeis.org/A000290),
_W_
[1](https://en.wikipedia.org/wiki/Square_(algebra))
[2](https://en.wikipedia.org/wiki/Square_root)
