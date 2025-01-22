# factorInteger

- _factorInteger(aFraction)_

Answer the `List` of prime factors of _aFraction_, each associated with its exponent.

```
>>> 36.factorInteger
[2 -> 2, 3 -> 2]

>>> (2 ^ 2) * (3 ^ 2)
36

>>> 120.factorInteger
[2 -> 3, 3 -> 1, 5 -> 1]

>>> (2 ^ 3) * 3 * 5
120

>>> 20.!.factorInteger
[
	2 -> 18,
	3 -> 8,
	5 -> 4,
	7 -> 2,
	11 -> 1,
	13 -> 1,
	17 -> 1,
	19 -> 1
]
```

A prime power has one prime factor:

```
>>> 25.factorInteger
[5 -> 2]
```

For negative numbers, the item _-1 -> 1_ is included in the list of factors:

```
>>> -120.factorInteger
[-1 -> 1, 2 -> 3, 3 -> 1, 5 -> 1]
```

At `Fraction` the prime factors of the denominator are given with negative exponents.

```
>>> 3/8.factorInteger
[2 -> -3, 3 -> 1]

>>> 225/224.factorInteger
[2 -> -5, 3 -> 2, 5 -> 2, 7 -> -1]

>>> 1/25.factorInteger
[5 -> -2]
```

Every positive integer can be represented as a product of prime factors:

```
>>> 60.factorInteger
[2 -> 2, 3 -> 1, 5 -> 1]
```

A unit factor:

```
>>> -60.factorInteger
[-1 -> 1, 2 -> 2, 3 -> 1, 5 -> 1]
```

Threads over lists:

```
>>> [11 101 1001].factorInteger
[
	[11 -> 1],
	[101 -> 1],
	[7 -> 1, 11 -> 1, 13 -> 1]
]
```

A unit factor:

```
-60.factorInteger
[-1 -> 1, 2 -> 2, 3 -> 1, 5 -> 1]
```

Use `factorInteger` to test for prime powers:

```
>>> 2401.factorInteger.size = 1
true
```

Use `factorInteger` to find all prime divisors of a number:

```
>>> 2434500.factorInteger.collect(key:/1)
[2 3 5 541]
```

The prime factorization of a prime number is itself:

```
>>> 11.factorInteger
[11 -> 1]
```

Compute the original number from a factorization:

```
>>> 120.factorInteger
[2 -> 3, 3 -> 1, 5 -> 1]

>>> [2 -> 3, 3 -> 1, 5 -> 1].collect { :x |
>>> 	x.key ^ x.value
>>> }.product
120
```

`divisors` gives the list of divisors including prime divisors:

```
>>> 20.divisors.select(isPrime:/1)
[2 5]

>>> 20.factorInteger
[2 -> 2, 5 -> 1]
```

`primeNu` gives the number of distinct prime factors:

```
>>> 10.!.factorInteger
[2 -> 8, 3 -> 4, 5 -> 2, 7 -> 1]

>>> 10.!.primeNu
4
```

Coprime numbers have no prime factors in common:

```
>>> 20.isCoprime(39)
true

>>> 20.factorInteger
[2 -> 2, 5 -> 1]

>>> 39.factorInteger
[3 -> 1, 13 -> 1]
```

At zero and negative one and one:

```
>>> 0.factorInteger
[0 -> 1]

>>> 1.factorInteger
[]

>>> -1.factorInteger
[-1 -> 1]
```

Plot the number of distinct prime factors of the first 100 numbers:

~~~spl svg=A
1:99.functionPlot { :each |
	each.factorInteger.size
}
~~~

![](sw/spl/Help/Image/factorInteger-A.svg)

* * *

See also: ->, Association, divisors, isPrime, primeFactors, primeFactorization, product

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/pco#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeFactorization.html)
[2](https://reference.wolfram.com/language/ref/FactorInteger.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/factor.html)

Categories: Arithmetic
