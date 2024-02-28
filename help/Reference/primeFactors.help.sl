# primeFactors

- _primeFactors(anInteger)_

Answer the `List` of prime integers the `product` of which is _anInteger_.

```
>>> 60.primeFactors
[2 2 3 5]

>>> [2 2 3 5].product
60

>>> 2:15.select { :each | each.primeFactors.max <= 5 }
[2 3 4 5 6 8 9 10 12 15]
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

* * *

See also: factorInteger, isPrime, product

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/qco),
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeFactorization.html)
[2](https://reference.wolfram.com/language/ref/FactorInteger.html)

Categories: Arithmetic
