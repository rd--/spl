# primesUpTo

- _primesUpTo(anInteger)_

Answer a `List` of the prime numbers less than or equal to _anInteger_.

```
>>> 25.primesUpTo
[2 3 5 7 11 13 17 19 23]

>>> 100.primesUpTo
[
	2 3 5 7 11 13 17 19 23 29
	31 37 41 43 47 53 59 61 67 71
	73 79 83 89 97
]
```

If _anInteger_ is prime it is the last element:

```
>>> 13.primesUpTo
[2 3 5 7 11 13]
```

If it is not prime, the last element is the previous prime:

```
>>> 42.primesUpTo
[2 3 5 7 11 13 17 19 23 29 31 37 41]
```

There is one prime up to two:

```
>>> 2.primesUpTo
[2]
```

* * *

See also: primesList, primesUpToDo

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/primes.html)

Categories: Primes
