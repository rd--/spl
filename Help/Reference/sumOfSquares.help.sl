# sumOfSquares

- _sumOfSquares(c)_

Answer the sum of the squared elements of the collection _c_.

At a vector:

```
>>> [3].iota.sumOfSquares
14

>>> (1 ^ 2) + (2 ^ 2) + (3 ^ 2)
14
```

At a matrix, answers a vector:

```
>>> let v = [3 3].iota.sumOfSquares;
>>> (v.sum, v)
(285, [66 93 126])
```

At an array, answers a matrix:

```
>>> let m = [3 3 3].iota.sumOfSquares;
>>> (m.sum.sum, m.sum, m)
(
	6930,
	[2061 2304 2565],
	[
		462  525  594;
		669  750  837;
		930 1029 1134
	]
)
```

* * *

See also: +, *, injectInto, square, sum

References:
_Mathworks_
[1](https://mathworks.com/help/deeplearning/ref/sumsqr.html)
