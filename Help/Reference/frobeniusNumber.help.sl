# frobeniusNumber

- _frobeniusNumber(aList)_

Answer the Frobenius number of _aList_.

The Frobenius number of 12, 16, 20, 27:

```
>>> [12 16 20 27].frobeniusNumber
89
```

Make an array of Frobenius numbers:

```
>>> { :i :n |
>>> 	[i .. i + n + 1].frobeniusNumber
>>> }.table(1:5, 1:10)
[
	-1 -1 -1 -1 -1 -1 -1 -1 -1 -1;
	 1  1  1  1  1  1  1  1  1  1;
	 2  2  2  2  2  2  2  2  2  2;
	 7  3  3  3  3  3  3  3  3  3;
	 9  9  4  4  4  4  4  4  4  4
]
```

Frobenius numbers of pairs:

```
>>> let n = 1:12.collect { :i |
>>> 	[i, i + 1].frobeniusNumber
>>> };
>>> (n, n.differences)
(
	[-1 1 5 11 19 29 41 55 71 89 109 131],
	[2 4 6 8 10 12 14 16 18 20 22]
)
```

Plot Frobenius numbers of length-4 runs:

~~~spl svg=A
1:30.collect { :i |
	([1 .. 4] + i).frobeniusNumber
}.differences.linePlot
~~~

![](sw/spl/Help/Image/frobeniusNumber-A.svg)

Some Frobenius numbers:

```
>>> [5 8 9 12].frobeniusNumber
11

>>> [5 8 15].frobeniusNumber
27

>>> [6 9 20].frobeniusNumber
43

>>> [83 89 97].frobeniusNumber
1421

>>> [9949 9967 9973].frobeniusNumber
24812836
```

* * *

See also: bockerLiptakAlgorithm, reduce, integerPartitions

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FrobeniusNumber.html)
[2](https://mathworld.wolfram.com/CoinProblem.html)
[3](https://reference.wolfram.com/language/ref/FrobeniusNumber.html),
_W_
[1](https://en.wikipedia.org/wiki/Coin_problem)

Further Reading: Böcker and Lipták 2004
