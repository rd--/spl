# antiDivisors

- _antiDivisors(n)_

Answers the `List` of integers that are anti-divisors of the integer _n_.
Anti-divisors are the numbers that do not divide a number by the largest possible margin.

Anti-divisors of 24 and 30:

```
>>> 24.antiDivisors
[7 16]

>>> 30.antiDivisors
[4 12 20]
```

Threads element-wise over list arguments:

```
>>> [603 871 824].antiDivisors
[
	2 5 6 17 18 71 134 241 402;
	2 3 7 21 26 83 134 249 581;
	3 9 16 17 27 61 97 183 549
]
```

First few anti-divisors,
OEIS [A130799](https://oeis.org/A130799):

```
>>> 3:20.antiDivisors
[
	2;
	3;
	2 3;
	4;
	2 3 5;
	3 5;
	2 6;
	3 4 7;
	2 3 7;
	5 8;
	2 3 5 9;
	3 4 9;
	2 6 10;
	3 11;
	2 3 5 7 11;
	4 5 7 12;
	2 3 13;
	3 8 13
]
```

Plot:

~~~spl svg=A
3:50.antiDivisors.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/antiDivisors-A.svg)

Plot count,
OEIS [A066272](https://oeis.org/A066272):

~~~spl svg=B
3:50.antiDivisors
.collect(size:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/antiDivisors-B.svg)

Plot sums,
OEIS [A058838](https://oeis.org/A058838):

~~~spl svg=C
let a = 1:50.antiDivisors;
(a.collect(sum:/1) + 1).stepPlot
~~~

![](sw/spl/Help/Image/antiDivisors-C.svg)

Plot anti-divisor class sums,
OEIS [A066518](https://oeis.org/A066518):

~~~spl svg=D
1:100
.collect(antiDivisorsClassSum:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/antiDivisors-D.svg)

Plot gaps between successive numbers with an anti-divisor class sum of zero,
OEIS [A066519](https://oeis.org/A066519):

~~~spl svg=E
1:175
.collect(antiDivisorsClassSum:/1)
.indicesOf(0)
.differences
.stepPlot
~~~

![](sw/spl/Help/Image/antiDivisors-E.svg)

* * *

See also: abs, divisors, mod

Guides: Integer Functions

References:
_OEIS_
[1](https://oeis.org/A130799)
[2](https://oeis.org/A066272)
[3](https://oeis.org/A058838)
