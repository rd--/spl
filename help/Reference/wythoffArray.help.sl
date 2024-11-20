# wythoffArray

- _wythoffArray(m, n)_

Answer the `Integer` at row _m_ and column _n_ of the infinite Wythoff array.
Every positive integer occurs exactly once in the array,
and every integer sequence defined by the Fibonacci recurrence can be derived by shifting a row of the array.

The first ten rows and columns of the Wythoff array:

```
>>> { :m :n | m.wythoffArray(n) }.table(1:10, 1:10)
[
	 1  2  3   5   8  13  21  34  55    89;
	 4  7 11  18  29  47  76 123 199   322;
	 6 10 16  26  42 68  110 178 288   466;
	 9 15 24  39  63 102 165 267 432   699;
	12 20 32  52  84 136 220 356 576   932;
	14 23 37  60  97 157 254 411 665  1076;
	17 28 45  73 118 191 309 500 809  1309;
	19 31 50  81 131 212 343 555 898  1453;
	22 36 58  94 152 246 398 644 1042 1686;
	25 41 66 107 173 280 453 733 1186 1919
]
```

* * *

See also: fibonacci, wythoffLower, wythoffPair, wythoffUpper

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WythoffArray.html),
_OEIS_
[1](https://oeis.org/A003622)
[2](https://oeis.org/A035513),
_W_
[1](https://en.wikipedia.org/wiki/Wythoff_array)

Further Reading: Fraenkel 1994, Morrison 1980

Categories: Matrix
