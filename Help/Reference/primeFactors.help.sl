# primeFactors

- _primeFactors(n)_

Answer the `List` of prime factors the `product` of which is _n_.

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

At zero and one:

```
>>> [-1 0 1].primeFactors
[;;]
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
OEIS [A027746](https://oeis.org/A027746),
reversing each row gives [A238689](https://oeis.org/A238689):

```
>>> 2:12.primeFactors
[
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

`min` of `primeFactors` is called the _least prime factor_.
Plot the first few entries of [A020639](https://oeis.org/A020639),
excluding the first:

~~~spl svg=A
{ :n |
	n.primeFactors.min
}.table(2:43).discretePlot
~~~

![](sw/spl/Help/Image/primeFactors-A.svg)

Plot the first few entries of [A020639](https://oeis.org/A020639),
excluding the first,
on a log scale:

~~~spl svg=B
{ :n |
	n.primeFactors.min
}.table(2:300).log.scatterPlot
~~~

![](sw/spl/Help/Image/primeFactors-B.svg)

Plot sum of the prime factors of _n_,
OEIS [A001414](https://oeis.org/A001414):

~~~spl svg=C
1:75.collect { :n |
	n.primeFactors.sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeFactors-C.svg)

Log scale scatter plot of the sum of the prime factors of the sum of the preceding terms,
OEIS [A268868](https://oeis.org/A268868):

~~~spl svg=D
let x = [1 1];
150.timesRepeat {
	x.add(x.sum.primeFactors.sum)
};
x.log.scatterPlot
~~~

![](sw/spl/Help/Image/primeFactors-D.svg)

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
