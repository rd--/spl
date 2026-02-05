# isSquareFree

- _isSquareFree(n)_

Answer `true` if the integer _n_ is square free, else `false`.
An integer is square free if it is divisible by no perfect square other than `one`.

Test whether a number is square free:

```
>>> 10.isSquareFree
true
```

The numbers 4 and 20 are not square free:

```
>>> 4.isSquareFree
false

>>> 20.isSquareFree
false
```

The number `one` is by convention taken to be squarefree,
`zero` is not:

```
>>> 1.isSquareFree
true

>>> 0.isSquareFree
false
```

The first few squarefree numbers are after `one`,
OEIS [A005117](https://oeis.org/A005117):

```
>>> 2:33.select(isSquareFree:/1)
[
	 2  3  5  6  7 10 11 13 14 15
	17 19 21 22 23 26 29 30 31 33
]
```

A number is squareful, or nonsquarefree, if it contains at least one square.
The first few squareful numbers are
OEIS [A013929](https://oeis.org/A013929):

```
>>> 1:52.reject(isSquareFree:/1)
[
	 4  8  9 12 16 18 20 24 25 27
	28 32 36 40 44 45 48 49 50 52
]
```

A number that is divisible by a square is not square free:

```
>>> 12.divisible(4)
true

>>> 12.isSquareFree
false
```

In the prime factorization of a square-free number, the exponents of primes are all 1:

```
>>> 210.isSquareFree
true

>>> 210.factorInteger
[2 1; 3 1; 5 1; 7 1]
```

`primeNu` is equal to `primeOmega` for square-free numbers:

```
>>> 14.isSquareFree
true

>>> 14.primeNu = 14.primeOmega
true
```

`moebiusMu` is zero for non-square-free integers:

```
>>> 12.isSquareFree
false

>>> 12.moebiusMu
0
```

Plot the first few squarefree numbers:

~~~spl svg=A
1:99.select(isSquareFree:/1).linePlot
~~~

![](sw/spl/Help/Image/isSquareFree-A.svg)

Plot the first few squareful numbers:

~~~spl svg=B
1:99.reject(isSquareFree:/1).linePlot
~~~

![](sw/spl/Help/Image/isSquareFree-B.svg)

* * *

See also: factorInteger, factor, isCubeFree, isDuplicateFree, isPerfectSquare, isPowerfulNumber, isPrime, isPrimePower, moebiusMu, primeOmega, primeNu

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Squarefree.html)
[2](https://mathworld.wolfram.com/Squareful.html)
[3](https://reference.wolfram.com/language/ref/SquareFreeQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Square-free_integer)

Categories: Testing, Math
