# akiyamaTanigawaNumber

- _akiyamaTanigawaNumber(n, m)_

Answer the _n,m_ Akiyama-Tanigawa number.

Numerators,
read by antidiagonals,
OEIS [A051714](https://oeis.org/A051714):

```
>>> 0:10.antidiagonalArray(
>>> 	akiyamaTanigawaNumber:/2
>>> ).numerator
[
	1;
	1 1;
	1 1 1;
	1 1 1 0;
	1 1 3 1 -1;
	1 1 2 1 -1 0;
	1 1 5 2 -3 -1 1;
	1 1 3 5 -1 -1 1 0;
	1 1 7 5 0 -4 1 1 -1;
	1 1 4 7 1 -1 -1 1 -1 0;
	1 1 9 28 49 -29 -5 8 1 -5 5
]
```

Denominators,
read by antidiagonals,
OEIS [A051715](https://oeis.org/A051715):

```
>>> 0:9.antidiagonalArray(
>>> 	akiyamaTanigawaNumber:/2
>>> ).denominator
[
	1;
	2 2;
	3 3 6;
	4 4 6 1;
	5 5 20 30 30;
	6 6 15 20 30 1;
	7 7 42 35 140 42 42;
	8 8 28 84 105 28 42 1;
	9 9 72 84 1 105 140 30 30;
	10 10 45 120 140 28 105 20 30 1
]
```

Numerators,
read by antidiagonals,
OEIS [A051714](https://oeis.org/A051714):

~~~spl svg=A oeis=A051714
0:21.antidiagonalArray(
	akiyamaTanigawaNumber:/2
).numerator
.catenate.logScale.scatterPlot
~~~

![](Help/Image/akiyamaTanigawaNumber-A.svg)

Denominators,
read by antidiagonals,
OEIS [A051715](https://oeis.org/A051715):

~~~spl svg=B oeis=A051715
0:21.antidiagonalArray(
	akiyamaTanigawaNumber:/2
).denominator
.catenate.logScale.scatterPlot
~~~

![](Help/Image/akiyamaTanigawaNumber-B.svg)

Akiyama-Tanigawa numbers,
read by antidiagonals:

~~~spl svg=C
5:21.antidiagonalArray(
	akiyamaTanigawaNumber:/2
).catenate.logScale.scatterPlot
~~~

![](Help/Image/akiyamaTanigawaNumber-C.svg)

* * *

See also: bernoulliNumber

Guides: Integer Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Bernoulli_number)
