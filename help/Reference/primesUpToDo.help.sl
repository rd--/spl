# primesUpToDo

- _primesUpTo(anInteger, aBlock:/1)_

Iterate over the prime numbers up to _anInteger_.

```
>>> let l = [];
>>> 15.primesUpToDo { :each | l.add(each) };
>>> l
[2 3 5 7 11 13]

>>> 15.primesUpTo
[2 3 5 7 11 13]
```

Count number of primes less than a number:

```
>>> let n = 0;
>>> 17401.primesUpToDo { :unused | n := n + 1 };
>>> n
2001
```

* * *

See also: primesList, primesUpTo
