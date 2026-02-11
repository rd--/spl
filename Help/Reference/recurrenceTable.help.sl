# recurrenceTable

- _recurrenceTable(f:/2, i, n)_

Answer a list of _n_ places given a recurrence function _f_ and an initial sequence _i_.

Solve an initial-value problem for a first-order difference equation:

```
>>> { :a :n |
>>> 	3 * a[n - 1]
>>> }.recurrenceTable([7], 10)
[
	   7     21     63    189    567
	1701   5103  15309  45927 137781
]
```

Find the first few Fibonacci numbers:

```
>>> { :a :n |
>>> 	a[n - 1] + a[n - 2]
>>> }.recurrenceTable([1 1], 10)
[1 1 2 3 5 8 13 21 34 55]
```

Linear ordinary difference equation with exact coefficients:

```
>>> { :a :n |
>>> 	2 * a[n - 1] + 1
>>> }.recurrenceTable([7], 8)
[7 15 31 63 127 255 511 1023]

>>> { :a :n |
>>> 	(3 * (n - 2) * a[n - 1])
>>> 	+
>>> 	(5 * a[n - 2])
>>> }.recurrenceTable([1 1], 10)
[
	1 1 8 53
	517 6469 99620 1825505
	38833705 941136445
]
```

Nonlinear ordinary difference equation with inexact coefficients:

```
>>> { :a :n |
>>> 	(1.3 * (a[n - 2] ^ 2))
>>> 	+
>>> 	(5.2 * a[n - 1])
>>> }.recurrenceTable([1 2], 6)
[1 2 11.7 66.04 521.365 8380.764]
```

The Cliff random number generator:

```
>>> { :a :n |
>>> 	((a[n - 1].log * 100) % 1).abs
>>> }.recurrenceTable([0.1], 5)
[0.1 0.741491 0.090734 0.017817 0.237592]
```

Rowland’s prime-generating sequence,
OEIS [A106108](https://oeis.org/A106108):

```
>>> { :a :n |
>>> 	a[n - 1] + gcd(a[n - 1], n)
>>> }.recurrenceTable([7], 12)
[7 8 9 10 15 18 19 20 21 22 33 36]
```

Study the evolution for a nonlinear map of the plane:

~~~spl svg=A
let p0 = [0.142857, 0.33];
{ :a :n |
	let [x, y] = a[n - 1];
	[
		(0.7 * x) + y,
		-0.7989995 + (x ^ 2)
	]
}.recurrenceTable([p0], 250)
.scatterPlot
~~~

![](sw/spl/Help/Image/recurrenceTable-A.svg)

Study the behavior of the logistic equation:

~~~spl svg=B
let r = 3.6;
{ :a :n |
	r * a[n-1] * (1 - a[n - 1])
}.recurrenceTable([1 / 3], 250)
.scatterPlot
~~~

![](sw/spl/Help/Image/recurrenceTable-B.svg)

Plot the Cliff random number generator:

~~~spl svg=C
{ :a :n |
	((a[n - 1].log * 100) % 1).abs
}.recurrenceTable([0.1], 250)
.scatterPlot
~~~

![](sw/spl/Help/Image/recurrenceTable-C.svg)

Find fixed points of a nonlinear recurrence equation:

~~~spl svg=D
{ :a :n |
	0.5 * a[n - 1] * (1 - a[n - 1])
}.recurrenceTable([-9 / 10], 20)
.scatterPlot
~~~

![](sw/spl/Help/Image/recurrenceTable-D.svg)

* * *

See also: linearRecurrence, recurrenceFilter, recurrenceMatrix, table

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RecurrenceTable.html)
