# isPrimePower

- _isPrimePower(aNumber)_

Answers `true` if _aNumber_ is an integer power of a prime number, else false.

Test whether a number is a prime power:

```
>>> 8.isPrimePower
true

>>> 2401.isPrimePower
true

>>> 2401.factorInteger
[7 -> 4]
```

The number 6 is not a prime power:

```
>>> 6.isPrimePower
false
```

At `Fraction`:

```
>>> 1/25.isPrimePower
true
```

[A246655](https://oeis.org/A246655) in the OEIS:

```
>>> 2:49.select(isPrimePower:/1)
[2 3 4 5 7 8 9 11 13 16 17 19 23 25 27 29 31 32 37 41 43 47 49]
```

The first few prime powers that are not prime:

```
>>> 1:99.select { :each | each.isPrimePower & { each.isPrime.not } }
[4, 8, 9, 16, 25, 27, 32, 49, 64, 81]
```

Recognize Mersenne numbers, integers that have the form _2^n - 1_:

```
>>> let isMersenneNumber = { :n | (n + 1).isEven & { (n + 1).isPrimePower } };
>>> [524285, 2147483647].collect(isMersenneNumber:/1)
[false, true]
```

The number of prime powers in intervals of size 1000:

```
>>> 0:4.collect { :each | let i = 10 ^ each; (i  .. i + 999).select(isPrimePower:/1).size }
[193, 187, 175, 140, 108]
```

Threads over lists:

```
>>> 1:9.isPrimePower
[false true true true true false true true true]
```

* * *

See also: isGaussianPrime, isPrime

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PrimePower.html)
[2](https://reference.wolfram.com/language/ref/PrimePowerQ.html),
_OEIS_
[1](https://oeis.org/A246655)

Categories: Testing
