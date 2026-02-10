# greatestPrimeFactor

- _greatestPrimeFactor(n)_

Answer the greatest prime factor for the integers _n_.

Specific values:

```
>>> 5329.greatestPrimeFactor
73

>>> 140737488355327.greatestPrimeFactor
13264529

>>> 59862819377.greatestPrimeFactor
13264529
```

Greatest prime factors of integers up to one hundred,
OEIS [A006530](https://oeis.org/A006530):

```
>>> 2:20.collect(greatestPrimeFactor:/1)
[
	    2  3  2  5  3  7  2  3  5
	11  3 13  7  5  2 17  3 19  5
]
```

Størmer numbers,
or arc-cotangent irreducible numbers,
OEIS [A005528](https://oeis.org/A005528):

```
>>> 1:96.select { :n |
>>> 	let a = n ^ 2 + 1;
>>> 	let b = 2 * n;
>>> 	a.greatestPrimeFactor >= b
>>> }
[
	 1  2  4  5  6  9 10 11 12 14
	15 16 19 20 22 23 24 25 26 27
	28 29 33 34 35 36 37 39 40 42
	44 45 48 49 51 52 53 54 56 58
	59 60 61 62 63 64 65 66 67 69
	71 74 77 78 79 80 81 82 84 85
	86 87 88 89 90 92 94 95 96
]
```

Log-scale plot of the greatest prime factors of the integers from two up to two hundred:

~~~spl svg=A
2:200.collect(greatestPrimeFactor:/1)
.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/greatestPrimeFactor-A.svg)

* * *

See also: factorInteger, leastPrimeFactor, prime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GreatestPrimeFactor.html),
_OEIS_
[1](https://oeis.org/A006530),
_W_
[1](https://en.wikipedia.org/wiki/Integer_factorization)
