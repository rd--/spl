# modularInverse

- _modularInverse(k, n)_

Answer the modular inverse of _k_ modulo _n_,
the number _r_ such that the remainder of the division of _r_ _k_ by _n_ is equal to 1.
If _k_ and _n_ are not coprime, no modular inverse exists.

Compute using integers:

```
>>> 3.modularInverse(5)
2

>>> (3 * 2) % 5
1

>>> 3.modularInverse(7)
5

>>> (3 * 5) % 7
1

>>> 11.modularInverse(8)
3

>>> (11 * 3) % 8
1

>>> 7.modularInverse(31)
9

>>> (7 * 9) % 31
1

>>> 42.modularInverse(2017)
1969

>>> (42 * 1969) % 2017
1

>>> 38.modularInverse(97)
23

>>> (38 * 23) % 97
1

>>> 111.modularInverse(10)
1

>>> (111 * 1) % 10
1
```

At large integers:

```
>>> 147198853397
>>> .modularInverse(73599183960)
43827926933

>>> (147198853397L * 43827926933L) % 73599183960L
1L
```

At negative numbers:

```
>>> -5.modularInverse(7)
4

>>> (-5 * 4) % 7
1

>>> -486.modularInverse(217)
121

>>> (-486 * 121) % 217
1
```

At modulus `one`:

```
>>> 40.modularInverse(1)
0

>>> (40 * 0) % 1
0
```

`modularInverse` is a periodic function:

```
>>> [
>>> 	2.modularInverse(5),
>>> 	(2 + 5).modularInverse(5)
>>> ]
[3 3]
```

If the results would be negative it is added to _n_:

```
>>> 5.modularInverse(7)
3

>>> (5 * 3) % 7
1

>>> 5.modularInverse(-7)
(-4 + 7)

>>> (5 * 3) % -7
1 + -7

>>> 52.modularInverse(-217)
96

>>> (52 * 96) % -217
1 + -217
```

If _k_ and _n_ are coprime, then _k_ is invertible modulo _n_ :

```
>>> 7.isCoprime(12)
true

>>> 7.modularInverse(12)
7
```

Computing `modularInverse` twice yields the original argument:

```
>>> 7.modularInverse(9).modularInverse(9)
7
```

For nonzero integers _k_ and _n_, _modularInverse(k, n)_ exists if and only if _k_ and _n_ are coprime:

```
>>> 10.isCoprime(21)
true

>>> 10.modularInverse(21)
19

>>> 21.modularInverse(10)
1
```

However, neither 10 and 22 nor 40 and 2018 are coprime:

```
>>> 10.isCoprime(22)
false

>>> {
>>> 	10.modularInverse(22)
>>> }.ifError { true }
true

>>> 40.isCoprime(2018)
false

>>> {
>>> 	40.modularInverse(2018)
>>> }.ifError { true }
true
```

Plot the sequence with a fixed modulus:

~~~spl svg=A
1:16.collect { :k |
	k.modularInverse(17)
}.discretePlot
~~~

![](sw/spl/Help/Image/modularInverse-A.svg)

* * *

See also: ^, eulerPhi, extendedEuclideanAlgorithm, isCoprime, mod, powerMod

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ModularInverse.html)
[2](https://reference.wolfram.com/language/ref/ModularInverse.html)
_W_
[1](https://en.wikipedia.org/wiki/Modular_multiplicative_inverse)
