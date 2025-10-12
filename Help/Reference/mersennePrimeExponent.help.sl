# mersennePrimeExponent

- _mersennePrimeExponent(n)_

Answer the _n_-th Mersenne exponents.

The first few Mersenne prime exponents:

```
>>> 1:10.collect(
>>> 	mersennePrimeExponent:/1
>>> )
[2 3 5 7 13 17 19 31 61 89]
```

Construct the corresponding Mersenne primes:

```
>>> (2L ^ [2 3 5 7 13 17 19 31 61 89]) - 1
[
	3
	7
	31
	127
	8191
	131071
	524287
	2147483647
	2305843009213693951L
	618970019642690137449562111L
]
```

Check that they are all primes:

```
>>> [2 3 5 7 13 17 19 31 61 89]
>>> .allSatisfy(isPrime:/1)
true
```

Log plot of first few terms:

~~~spl svg=A
1:50.collect(
	mersennePrimeExponent:/1
).log.scatterPlot
~~~

![](sw/spl/Help/Image/mersennePrimeExponent-A.svg)

* * *

See also: ^, isPrime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MersennePrimeExponent.html),
_OEIS_
[1](https://oeis.org/A000043)
