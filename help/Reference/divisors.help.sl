# divisors

_divisors(anInteger)_

Answers the list of integers that are divisors of _anInteger_.

```
>>> 60.divisors
[1 2 3 4 5 6 10 12 15 20 30 60]

>>> 1729.divisors
[1 7 13 19 91 133 247 1729]

>>> 1729 / [1 7 13 19 91 133 247 1729]
[1729 247 133 91 19 13 7 1]
```

For integer input, integer divisors are returned:

```
>>> 6.divisors
[1 2 3 6]
```

Divisors threads element‐wise over list arguments:

```
>>> [605 871 824].divisors
[1 5 11 55 121 605; 1 13 67 871; 1 2 4 8 103 206 412 824]
```

Find all perfect numbers less than 500:

```
>>> 1:499.select { :each | each.divisors.sum = (2 * each) }
[6 28 496]
```

* * *

See also: remainder

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Divisor.html)
[2](http://reference.wolfram.com/language/ref/Divisors.html)

Categories: Arithmetic
