# isRegularNumber

- _isRegularNumber(n)_

An integer _n_ is called regular if it is 5-smooth,
also called Hamming numbers.

```
>>> 30:60.select(isRegularNumber:/1)
[30 32 36 40 45 48 50 54 60]

>>> [30 32 36 40 45 48 50 54 60]
>>> .primeFactors
[
	2 3 5;
	2 2 2 2 2;
	2 2 3 3;
	2 2 2 5;
	3 3 5;
	2 2 2 2 3;
	2 5 5;
	2 3 3 3;
	2 2 3 5
]
```

There are 34 regular numbers between one and one hundred:

```
>>> 1:100.count(isRegularNumber:/1)
34
```

Plot sequence of regular numbers:

~~~spl svg=A
1:999
.select(isRegularNumber:/1)
.linePlot
~~~

![](sw/spl/Help/Image/isRegularNumber-A.svg)

* * *

See also: isSmoothNumber, primeFactors, primeLimit

Guides: Integer Functions, Integer Sequences

References:
_OEIS_
[1](https://oeis.org/A051037)
_W_
[1](https://en.wikipedia.org/wiki/Regular_number)

Categories: Testing
