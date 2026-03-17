# withoutTrailingZeroes

- _withoutTrailingZeroes(n, b=10)_

Answer _n_ with any trailing zeroes, in base _b_, deleted.

Omit trailing zeros from _n_,
threads over lists,
OEIS [A004151](https://oeis.org/A004151):

```
>>> 1:20.withoutTrailingZeroes
[
	 1  2  3  4  5  6  7  8  9 1
	11 12 13 14 15 16 17 18 19 2
]
```

Omit trailing zeros from _n!_,
OEIS [A004154](https://oeis.org/A004154):

```
>>> 0:10.!.withoutTrailingZeroes
[1 1 2 6 24 12 72 504 4032 36288 36288]
```

The final nonzero digit of _n!_,
OEIS [A008904](https://oeis.org/A008904):

```
>>> 0:20.!.withoutTrailingZeroes % 10
[
	1 1 2 6 4 2 2 4 2 8
	8 8 6 8 2 8 8 6 8 2
	4
]
```

The final nonzero digit of _n!_,
OEIS [A008904](https://oeis.org/A008904):

~~~spl svg=A oeis=A008904
let n = 0:65.!.withoutTrailingZeroes;
(n % 10).stepPlot
~~~

![](sw/spl/Help/Image/withoutTrailingZeroes-A.svg)

* * *

See also: integerExponent, isZero, withoutTrailing

Guides: List Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Trailing_zero)
