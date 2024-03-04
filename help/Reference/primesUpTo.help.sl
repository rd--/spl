# primesUpTo

- _primesUpTo(anInteger)_

Answer a `List` of the prime numbers up to the limit _anInteger_.

```
>>> 100.primesUpTo
[2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97]
```

If limit is prime it is the last element:

```
>>> 13.primesUpTo
[2 3 5 7 11 13]
```

If limit is not prime, the last element is the previous prime:

```
>>> 42.primesUpTo
[2 3 5 7 11 13 17 19 23 29 31 37 41]
```

* * *

See also: primesList

Categories: Primes
