# primeFactors

- _primeFactors(aFraction)_

Answer the `List` of prime factors the `product` of which is _aFraction_.

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
2 # 31

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

* * *

See also: factorInteger, isPrime, primeLimit, product

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/qco),
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeFactorization.html)
[2](https://reference.wolfram.com/language/ref/FactorInteger.html)

Categories: Arithmetic
