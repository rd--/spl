# lahNumber

- _lahNumber(n, k)_

Answer the _Lah(n,k)_ number.

The first few terms,
OEIS [A271703](https://oeis.org/A271703),
or,
without the intial zero term,
OEIS [A105278](https://oeis.org/A105278):

```
>>> 0:7.triangularArray(lahNumber:/2)
[
	1;
	0 1;
	0 2 1;
	0 6 6 1;
	0 24 36 12 1;
	0 120 240 120 20 1;
	0 720 1800 1200 300 30 1;
	0 5040 15120 12600 4200 630 42 1
]
```

Row sums,
OEIS [A000262](https://oeis.org/A000262):

```
>>> 0:8.triangularArray(lahNumber:/2)
>>> .collect(sum:/1)
[1 1 3 13 73 501 4051 37633 394353]
```

The signed form,
OEIS [A008297](https://oeis.org/A008297):

```
>>> 1:7.triangularArray { :n :k |
>>> 	let m = binomial(n - 1, k - 1);
>>> 	(-1 ^ n) * n.! * m / k.!
>>> }
[
	-1;
	2 1;
	-6 -6 -1;
	24 36 12 1;
	-120 -240 -120 -20 -1;
	720 1800 1200 300 30 1;
	-5040 -15120 -12600 -4200 -630 -42 -1
]
```

The matrix inverse,
OEIS [A111596](https://oeis.org/A111596):

```
>>> 0:7.triangularArray { :n :k |
>>> 	(-1 ^ (n - k)) * lahNumber(n, k)
>>> }
[
	1;
	-0 1;
	0 -2 1;
	-0 6 -6 1;
	0 -24 36 -12 1;
	-0 120 -240 120 -20 1;
	0 -720 1800 -1200 300 -30 1;
	-0 5040 -15120 12600 -4200 630 -42 1
]
```

Plot
OEIS [A111596](https://oeis.org/A111596):

~~~spl svg=A
0:11.triangularArray { :n :k |
	(-1 ^ (n - k)) * lahNumber(n, k)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/lahNumber-A.svg)

* * *

See also: binomial, factorialPower

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LahNumber.html),
_OEIS_
[1](https://oeis.org/A271703),
_W_
[1](https://en.wikipedia.org/wiki/Lah_number)
