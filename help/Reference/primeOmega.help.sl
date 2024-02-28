# primeOmega

- _primeOmega(anInteger)_

Answer the number of prime factors counting multiplicities in _anInteger_.

```
>>> 12.primeOmega
3

>>> 30.primeOmega
3
```

Compute for large integers:

```
>>> 30n.!.primeOmega
59
```

Threads over lists:

```
>>> [4 12 24].primeOmega
[2 3 4]
```

`primeOmega` is a completely additive function:

```
>>> (24 * 40).primeOmega
24.primeOmega + 40.primeOmega
```

`primeOmega` gives the exponent for a prime power:

```
>>> (7 ^ 5).isPrimePower
true

>>> (7 ^ 5).primeOmega
5
```

`primeOmega` and `primeNu` are equivalent when the argument is square-free:

```
>>> 165.isSquareFree
true

>>> 165.primeOmega
165.primeNu
```

Plot the `primeOmega` sequence for the first 100 numbers:

~~~
1:100.collect(primeOmega:/1).plot
~~~

* * *

See also: factorInteger, isPrimePower, primeNu

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PrimeOmega.html)
