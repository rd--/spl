# primesUpToDo

- _primesUpTo(n, aBlock:/1)_

Iterate over the prime numbers that are less than or equal to the integer _n_.

```
>>> let l = [];
>>> 15.primesUpToDo { :each |
>>> 	l.add(each)
>>> };
>>> l
[2 3 5 7 11 13]
```

C.f. `primesUpTo`:

```
>>> 15.primesUpTo
[2 3 5 7 11 13]
```

Count number of primes less than or equal to a number:

```
>>> let n = 0;
>>> 17401.primesUpToDo { :unused |
>>> 	n := n + 1
>>> };
>>> n
2002
```

C.f. `primePi`:

```
>>> 17401.primePi
2002
```

* * *

See also: primePi, primesList, primesUpTo

Guides: Prime Number Functions
