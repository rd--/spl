# differenceOfSquares

- _differenceOfSquares(x, y)_

Answer _(x+y)(x-y)_,
an alternative factorization for _x²+y²_.

```
>>> let x = 1 + (2 ^ -29);
>>> let y = 1 + (2 ^ -30);
>>> let a = differenceOfSquares(x, y);
>>> let b = x.square - y.square;
>>> (a, b)
(
	1.862645151833042E-9,
	1.862645149230957E-9
)
```

* * *

See also: -, square, subtract

References:
_W_
[1](https://en.wikipedia.org/wiki/Difference_of_two_squares)
