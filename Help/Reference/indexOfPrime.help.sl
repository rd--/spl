# indexOfPrime

- _indexOfPrime(n)_

Answer the one-index of the integer _n_ in the list of prime numbers,
or `zero` if not _n_ is not prime.

```
>>> 97.indexOfPrime
25

>>> 25.primesList.last
97
```

Inverse is `prime`:

```
>>> 25.prime
97
```

For prime numbers equal to `primePi`:

```
>>> 97.primePi
25

>>> 98.primePi
25

>>> 98.indexOfPrime
0
```

Plot first few terms:

~~~spl svg=A
0:99.collect(
	indexOfPrime:/1
).discretePlot
~~~

![](sw/spl/Help/Image/indexOfPrime-A.svg)

* * *

See also: prime, primePi, primesList

Guides: Prime Number Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/List_of_prime_numbers)
