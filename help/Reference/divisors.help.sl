# divisors

- _divisors(anInteger)_

Answers the `List` of integers that are divisors of _anInteger_.
For all positive integers, `divisors` includes `one` and _anInteger_ as the first and last entries.

```
>>> 30.divisors
[1 2 3 5 6 10 15 30]

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

>>> [12 28 45 53 64].divisors
[
	1 2 3 4 6 12;
	1 2 4 7 14 28;
	1 3 5 9 15 45;
	1 53;
	1 2 4 8 16 32 64
]
```

Find all perfect numbers less than 500:

```
>>> 1:499.select { :each | each.divisors.sum = (2 * each) }
[6 28 496]
```

A logarithmic plot of `divisors` of the diatonic number 8640,
showing the sigmoid shape typical of divisor sets:

~~~
8640.divisors.log2.plot
~~~

A logarithmic plot of the intervals between consecutive divisors:

~~~
8640.divisors.log2.differences.plot
~~~


>>> 345600.divisors

* * *

See also: remainder

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Divisor.html)
[2](http://reference.wolfram.com/language/ref/Divisors.html)

Categories: Arithmetic
