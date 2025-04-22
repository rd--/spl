# primeNu

- _primeNu(anInteger)_

Answer the number of distinct prime factors of _anInteger_.

```
>>> 24.primeNu
2

>>> 105.primeNu
3
```

Compute for large integers:

```
>>> 50L.!.primeNu
15
```

`primeNu` is an additive function:

```
>>> (9 * 40).primeNu
9.primeNu + 40.primeNu
```

`primeNu` gives `one` for a prime power:

```
>>> 49.isPrimePower
true

>>> 49.primeNu
1
```

Plot the `primeNu` sequence for the first 100 numbers:

~~~spl svg=A
1:100.functionPlot(primeNu:/1)
~~~

![](sw/spl/Help/Image/primeNu-A.svg)

* * *

See also: factorInteger, gcd, isPrime, isPrimePower, isSquareFree, primeOmega

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PrimeNu.html)

Categories: Math
