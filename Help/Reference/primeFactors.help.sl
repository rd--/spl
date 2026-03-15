# primeFactors

- _primeFactors(n)

Answer the `List` of prime factors the `product` of which is _n_.
The list is in increasing order.

In the `Integer` case all factors will be integers:

```
>>> 60.primeFactors
[2 2 3 5]

>>> [2 2 3 5].product
60

>>> 2:15.select { :each |
>>> 	each.primeFactors.max <= 5
>>> }
[2 3 4 5 6 8 9 10 12 15]

>>> 25.primeFactors
[5 5]

>>> 200.primeFactors
[2 2 2 5 5]

>>> 138.primeFactors
[2 3 23]
```

At `one`:

```
>>> 1.primeFactors
[]

>>> [].product
1
```

Extended convention:

```
>>> 0.primeFactors('Extended')
[0]

>>> [0].product
0

>>> 1.primeFactors('Extended')
[1]

>>> [1].product
1

>>> -60.primeFactors('Extended')
[-1 2 2 3 5]

>>> [-1 2 2 3 5].product
-60
```

The number 30 is the smallest 3-dimensional number,
it contains each of the three smallest prime numbers (2, 3, and 5) once:

```
>>> 30.primeFactors
[2 3 5]
```

At answer of `^`:

```
>>> (2 ^ 31).primeFactors
31 # [2]

>>> (2 ^ 31 + 1).primeFactors
[3 715827883]

>>> (2 ^ 31 + 2).primeFactors
[2 5 5 13 41 61 1321]
```

The inverse of `primeFactors` is `product`:

```
>>> 60.primeFactors.product
60
```

At `Fraction`:

```
>>> 22/49.primeFactors
[2 11 1/7 1/7]

>>> 1/25.primeFactors
[1/5 1/5]

>>> 64/63.primeFactors
[2 2 2 2 2 2 1/3 1/3 1/7]
```

Threads elementwise over lists:

```
>>> [60 22/49].primeFactors
[2 2 3 5; 2 11 1/7 1/7]

>>> [4 231 315 8589298611].primeFactors
[2 2; 3 7 11; 3 3 5 7; 3 2863099537]
```

Sorted into descending order:

```
>>> [
>>> 	2 3 5 7 11
>>> 	1 4 6 8 9 10 12 22
>>> ].collect { :each |
>>> 	each.primeFactors.sort(>)
>>> }
[
	2; 3; 5; 7; 11;
	; 2 2; 3 2; 2 2 2; 3 3; 5 2; 3 2 2; 11 2
]
```

The largest prime factor of an integer:

```
>>> 600851475143.primeFactors.max
6857
```

At a power of two:

```
>>> (2 ^ 52).primeFactors
52 # [2]
```

Table of first few terms,
using the extended definition,
OEIS [A027746](https://oeis.org/A027746),
reversing each row gives [A238689](https://oeis.org/A238689):

```
>>> 1:12.primeFactors('Extended')
[
	1;
	2;
	3;
	2 2;
	5;
	2 3;
	7;
	2 2 2;
	3 3;
	2 5;
	11;
	2 2 3
]
```

Smallest prime factor of _2^n+1_,
OEIS [A002586](https://oeis.org/A002586):

```
>>> 1:17.collect { :n |
>>> 	(2 ^ n + 1).primeFactors.min
>>> }
[3 5 3 17 3 5 3 257 3 5 3 17 3 5 3 65537 3]
```

Relation to `factorInteger`:

```
>>> 60.primeFactors
[2 2 3 5]

>>> 60.factorInteger.collect { :f |
>>> 	List(f[2], f[1])
>>> }
[2 2; 3; 5]
```

`min` of `primeFactors` is called the _least prime factor_,
OEIS [A020639](https://oeis.org/A020639):

~~~spl svg=A oeis=A020639
{ :n |
	n.primeFactors.min
}.table(2:43).discretePlot
~~~

![](sw/spl/Help/Image/primeFactors-A.svg)

Least prime factors,
log scale plot,
OEIS [A020639](https://oeis.org/A020639):

~~~spl svg=B oeis=A020639
{ :n |
	n.primeFactors.min
}.table(2:300).log.scatterPlot
~~~

![](sw/spl/Help/Image/primeFactors-B.svg)

Sum of the prime factors of _n_,
OEIS [A001414](https://oeis.org/A001414):

~~~spl svg=C oeis=A001414
1:75.collect { :n |
	n.primeFactors.sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeFactors-C.svg)

The sum of the prime factors of the sum of the preceding terms,
log scale scatter plot,
OEIS [A268868](https://oeis.org/A268868):

~~~spl svg=D oeis=A268868
let x = [1 1];
150.timesRepeat {
	x.add(x.sum.primeFactors.sum)
};
x.log.scatterPlot
~~~

![](sw/spl/Help/Image/primeFactors-D.svg)

Number of primes congruent to one modulo four dividing _n_,
OEIS [A083025](https://oeis.org/A083025):

~~~spl svg=E oeis=A083025
1:150.collect { :n |
	n.primeFactors.select { :x |
		x % 4 = 1
	}.size
}.discretePlot
~~~

![](sw/spl/Help/Image/primeFactors-E.svg)

Alternating sum of the prime indices of _n_,
OEIS [A316524](https://oeis.org/A316524):

~~~spl svg=F oeis=A316524
1:85.collect { :n |
	n.primeFactors
	.primePi
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/primeFactors-F.svg)

Alternating sum of all prime factors of _n_,
OEIS [A071321](https://oeis.org/A071321):

~~~spl svg=G oeis=A071321
1:85.collect { :n |
	n.primeFactors
	.alternatingSum
}.logScale.discretePlot
~~~

![](sw/spl/Help/Image/primeFactors-G.svg)

* * *

See also: distinctPrimeFactors, factorInteger, isPrime, primeFactorization, primeLimit, product

Guides: Prime Number Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/qco),
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeFactorization.html)
[2](https://reference.wolfram.com/language/ref/FactorInteger.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/factor.html),
_OEIS_
[1](https://oeis.org/A020639)
[2](https://oeis.org/A027746)
[3](https://oeis.org/A238689)
[4](https://oeis.org/A001414)
[5](https://oeis.org/A268868),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Integer.html#-factors)

Categories: Arithmetic
