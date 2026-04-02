# mersennePrimeExponent

- _mersennePrimeExponent(n)_

Answer the _n_-th Mersenne exponents.

Mersenne prime exponents,
threads over lists,
OEIS [A000043](https://oeis.org/A000043):

```
>>> 1:10.mersennePrimeExponent
[2 3 5 7 13 17 19 31 61 89]
```

Construct the corresponding Mersenne primes,
OEIS [A000668](https://oeis.org/A000668):

```
>>> let e = 1:10.mersennePrimeExponent;
>>> (2L ^ e) - 1
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
>>> 1:10.mersennePrimeExponent
>>> .allSatisfy(isPrime:/1)
true
```

Mersenne prime exponents,
OEIS [A000043](https://oeis.org/A000043):

~~~spl svg=A oeis=A000043
1:50.mersennePrimeExponent
.scatterPlot.log
~~~

![](Help/Image/mersennePrimeExponent-A.svg)

* * *

See also: ^, isPrime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MersennePrimeExponent.html),
_OEIS_
[1](https://oeis.org/A000043)
