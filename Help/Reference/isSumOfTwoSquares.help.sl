# isSumOfTwoSquares

- _isSumOfTwoSquares(n)_

Predicate that tells if the integer _n_ can be written as the sum of two squares.

```
>>> 2450.isSumOfTwoSquares
true

>>> 2.squaresR(2450)
12
```

First few terms:

```
>>> 0:32.select(isSumOfTwoSquares:/1)
[
	 0  1  2  4  5  8  9 10 13 16
	17 18 20 25 26 29 32
]
```

* * *

See also: squaresR

References:
_OEIS_
[1](https://oeis.org/A001481),
_W_
[1](https://en.wikipedia.org/wiki/Sum_of_two_squares_theorem)
