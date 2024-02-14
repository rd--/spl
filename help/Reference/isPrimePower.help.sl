# isPrimePower

_isPrimePower(anInteger | aFraction)_

Answers true if anInteger is an integer power of a prime number, else false.

Test whether a number is a prime power:

```
>>> 8.isPrimePower
true
```

The number 6 is not a prime power:

```
>>> 6.isPrimePower
false
```

At Fraction:

```
>>> 1/25.isPrimePower
true
```

The first few prime powers that are not prime:

```
>>> 1:99.select { :each | each.isPrimePower & { each.isPrime.not } }
[4, 8, 9, 16, 25, 27, 32, 49, 64, 81]
```

Recognize Mersenne numbers, integers that have the form _2^n - 1_:

```
>>> let isMersenneNumber = { :n | (n + 1).even & { (n + 1).isPrimePower } };
>>> [524285, 2147483647].collect(isMersenneNumber:/1)
[false, true]
```

The number of prime powers in intervals of size 1000:

```
>>> 0:4.collect { :each | let i = 10 ^ each; (i  .. i + 999).select(isPrimePower:/1).size }
[193, 187, 175, 140, 108]
```

* * *

See also: isGaussianPrime, isPrime

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PrimePowerQ.html)
