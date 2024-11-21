# isAlmostPrime

- _isAlmostPrime(anInteger, count)_

A natural number is called _k_-almost prime if it has _k_ prime factors.

[A000040](https://oeis.org/A000040) in OEIS:

```
>>> 1:19.select { :each | each.isAlmostPrime(1) }
[2 3 5 7 11 13 17 19]
```

[A001358](https://oeis.org/A001358) in OEIS:

```
>>> 1:22.select { :each | each.isAlmostPrime(2) }
[4 6 9 10 14 15 21 22]
```

[A046308](https://oeis.org/A046308) in OEIS:

```
>>> 1:449.select { :each | each.isAlmostPrime(7) }
[128 192 288 320 432 448]
```

[A069272](https://oeis.org/A069272) in OEIS:

```
>>> 1:5121.select { :each | each.isAlmostPrime(11) }
[2048 3072 4608 5120]
```

The multiple of a _k1_-almost prime and a _k2_-almost prime is a _(k1 + k2)_-almost prime.

```
>>> (320 * 5120).isAlmostPrime(7 + 11)
true
```

* * *

See also: primeFactors, size

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AlmostPrime.html),
_OEIS_
[1](https://oeis.org/A000040)
[2](https://oeis.org/A001358)
[3](https://oeis.org/A046308)
[4](https://oeis.org/A069272),
_W_
[1](https://en.wikipedia.org/wiki/Almost_prime)

Categories: Testing, Numbers
