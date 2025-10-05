# politeness

- _politeness(n)_

The `politeness` of a number is non-zero for polite numbers.

```
>>> 0:100.collect(politeness:/1)
[
	0 0 0 1 0 1 1 1 0 2
	1 1 1 1 1 3 0 1 2 1
	1 3 1 1 1 2 1 3 1 1
	3 1 0 3 1 3 2 1 1 3
	1 1 3 1 1 5 1 1 1 2
	2 3 1 1 3 3 1 3 1 1
	3 1 1 5 0 3 3 1 1 3
	3 1 2 1 1 5 1 3 3 1
	1 4 1 1 3 3 1 3 1 1
	5 3 1 3 1 3 1 1 2 5
	2
]
```

`politeness` counts the number of an integer can be expressed as the sum of consecutive integers:

```
>>> 9.politeness
2

>>> (2 + 3 + 4, 4 + 5)
(9, 9)

>>> 15.politeness
3

>>> [4:6, 1:5, 7:8].collect(sum:/1)
[15 15 15]
```

The politeness is one less than the number of odd divisors:

```
>>> 99.divisors.count(isOdd:/1) - 1
5

>>> 99.politeness
5
```

Plot politeness of first few numbers:

~~~spl svg=A
0:200.collect(politeness:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/politeness-A.svg)

* * *

See also: divisors, isPoliteNumber, mod

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A069283),
_W_
[1](https://en.wikipedia.org/wiki/Polite_number)

