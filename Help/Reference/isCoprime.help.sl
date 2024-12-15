# isCoprime

- _isCoprime(anInteger, anotherInteger)_
- _isCoprime(aCollection)_

In the binary form answer true if _anInteger_ and _anotherInteger_ are relatively prime, else false.

In the unary form answer true if all possible pairs of _aCollection_ are relatively prime, else false.

Test whether two numbers are relatively prime:

```
>>> 8.isCoprime(11)
true

>>> 8.gcd(11) = 1
true
```

Numbers are not coprime to themselves:

```
>>> 4.isCoprime(4)
false

>>> [7 7].isCoprime
false
```

The numbers 2 and 4 are not relatively prime:

```
>>> 2.isCoprime(4)
false
```

Are all combinations of integers in a collection coprime:

```
>>> [2, 3, -5, 7].isCoprime
true
```

Numbers up to 100 that that are coprime to 12:

```
>>> 1:100.select { :each |
>>> 	each.isCoprime(12)
>>> }
[
	 1  5  7 11 13 17 19 23 25 29
	31 35 37 41 43 47 49 53 55 59
	61 65 67 71 73 77 79 83 85 89
	91 95 97
]
```

Find the fraction of pairs of the first 100 numbers that are relatively prime:

```
>>> 1:100
>>> .tuples(2)
>>> .collect(isCoprime:/1)
>>> .boole
>>> .sum / (10 ^ 4)
0.6087
```

Prime numbers are relatively prime to each other:

```
>>> [10 15 20 25]
>>> .collect(nthPrime:/1)
>>> .isCoprime
true

>>> 99.primesList.isCoprime
true
```

_eulerPhi_ gives the count of the positive integers up to _n_ that are relatively prime to _n_:

```
>>> 20.eulerPhi
8

>>> 1:20.select { :each |
>>> 	each.isCoprime(20)
>>> }
[1 3 7 9 11 13 17 19]

>>> 99.eulerPhi
60

>>> 1:99.select { :each |
>>> 	each.isCoprime(99)
>>> }.size
60
```

The least common multiple of two coprime numbers is equal to their product:

```
>>> 6.isCoprime(11)
true

>>> 6.lcm(11)
(6 * 11)
```
Visualize when two numbers are coprime:

~~~spl png=A
{ :i :j |
	i.isCoprime(j).boole
}.table(1:99, 1:99).Bitmap
~~~

![](sw/spl/Help/Image/isCoprime-A.png)

* * *

See also: %, eulerPhi, factorInteger, gcd, isPrime

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RelativelyPrime.html)
[2](https://reference.wolfram.com/language/ref/CoprimeQ.html)

Categories: Math
