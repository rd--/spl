# radical

- _radical(n)_

Answer the radical of the integer _n_,
the product of the prime divisors.

```
>>> 999999.radical
111111
```

First few terms,
OEIS [A007947](https://oeis.org/A007947):

```
>>> 1:78.collect(radical:/1)
[
	 1  2  3  2  5  6  7  2  3 10
	11  6 13 14 15  2 17  6 19 10
	21 22 23  6  5 26  3 14 29 30
	31  2 33 34 35  6 37 38 39 10
	41 42 43 22 15 46 47  6  7 10
	51 26 53  6 55 14 57 58 59 30
	61 62 21  2 65 66 67 34 69 70
	71  6 73 74 15 38 77 78
]
```

Plot first few terms:

~~~spl svg=A
1:150.collect(radical:/1).scatterPlot
~~~

![](sw/spl/Help/Image/radical-A.svg)

Log plot of first few terms:

~~~spl svg=B
1:300.collect(radical:/1).log.scatterPlot
~~~

![](sw/spl/Help/Image/radical-B.svg)

* * *

See also: factorInteger, product

Guides: Integer Functions, Integer Sequences, Prime Number Functions

References:
_OEIS_
[1](https://oeis.org/A007947),
_W_
[1](https://en.wikipedia.org/wiki/Radical_of_an_integer)
