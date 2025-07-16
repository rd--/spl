# isSphenicNumber

- _isSphenicNumber(n)_

Predicate to decide if _n_ is a sphenic number.

The first few sphenic numbers:

```
>>> 1:165.select(isSphenicNumber:/1)
[30 42 66 70 78 102 105 110 114 130 138 154 165]
```

Consecutive sphenic numbers:

```
>>> [
>>> 	230 231;
>>> 	1309 1310 1311;
>>> 	2013 2014 2015;
>>> 	2665 2666 2667
>>> ].collect { :each |
>>> 	each.allSatisfy(isSphenicNumber:/1)
>>> }
[true true true true]
```

* * *

See also: isComposite, isPrime, primeFactors, size

Guides: Integer Functions, Integer Sequences, Prime Number Functions

References:
_OEIS_
[1](https://oeis.org/A007304)
[2](https://oeis.org/A165936),
_W_
[1](https://en.wikipedia.org/wiki/Sphenic_number)

Categories: Testing, Numbers
