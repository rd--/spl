# leastPrimeFactorList

- _leastPrimeFactorList(n)_

Answer two lists,
the first has the least prime factors for the integers _1:n_,
the second has the prime numbers up to _n_.

Least prime factors of integers up to one hundred,
OEIS [A020639](https://oeis.org/A020639):

```
>>> 100.leastPrimeFactorList
[
	 0  2  3  2  5  2  7  2  3  2
	11  2 13  2  3  2 17  2 19  2
	 3  2 23  2  5  2  3  2 29  2
	31  2  3  2  5  2 37  2  3  2
	41  2 43  2  3  2 47  2  7  2
	 3  2 53  2  5  2  3  2 59  2
	61  2  3  2  5  2 67  2  3  2
	71  2 73  2  3  2  7  2 79  2
	 3  2 83  2  5  2  3  2 89  2
	 7  2  3  2  5  2 97  2  3  2
	;
	 2  3  5  7 11 13 17 19 23 29
	31 37 41 43 47 53 59 61 67 71
	73 79 83 89 97
]
```

Plot least prime factors of integers up to one hundred:

~~~spl svg=A
100.leastPrimeFactorList.first.stepPlot
~~~

![](sw/spl/Help/Image/leastPrimeFactorList-A.svg)

* * *

See also: factorInteger, leastPrimeFactor, prime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LeastPrimeFactor.html),
_OEIS_
[1](https://oeis.org/A020639),
_W_
[1](https://en.wikipedia.org/wiki/Integer_factorization)

Further Reading: Pritchard 1987
