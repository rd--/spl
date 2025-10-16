# leastPrimeFactor

- _leastPrimeFactor(n)_

Answer the least prime factor for the integers _n_.

Specific values:

```
>>> 5329.leastPrimeFactor
73

>>> 140737488355327.leastPrimeFactor
2351

>>> 59862819377.leastPrimeFactor
4513
```

Confirm `leastPrimeFactor` agrees with `primeFactors` up to _k_:

```
>>> let k = 100;
>>> 2:k.allSatisfy { :n |
>>> 	n.leastPrimeFactor
>>> 	=
>>> 	n.primeFactors.first
>>> }
true
```

Least prime factors of integers up to one hundred,
OEIS [A020639](https://oeis.org/A020639):

```
>>> 1:100.collect(leastPrimeFactor:/1)
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
]
```

Log-scale plot of the least prime factors of the integers from two up to one hundred:

~~~spl svg=A
2:100.collect(leastPrimeFactor:/1)
.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-A.svg)

* * *

See also: factorInteger, leastPrimeFactorList, prime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LeastPrimeFactor.html),
_OEIS_
[1](https://oeis.org/A020639),
_W_
[1](https://en.wikipedia.org/wiki/Integer_factorization)
