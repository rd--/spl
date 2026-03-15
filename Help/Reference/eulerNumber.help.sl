# eulerNumber

- _eulerNumber(n)_

Answer the _n_-th Euler number.

Calculate Euler numbers:

```
>>> 14.eulerNumber
-199360981

>>> 16.eulerNumber
19391512145

>>> 18.eulerNumber
-2404879675441

>>> 20.eulerNumber
370371188237525

>>> 22L.eulerNumber
-69348874393137901L
```

The first ten Euler numbers,
threads over lists,
OEIS [A122045](https://oeis.org/A122045):

```
>>> [0 .. 10].eulerNumber
[1 0 -1 0 5 0 -61 0 1385 0 -50521]
```

The first ten non-zero Euler numbers,
OEIS [A028296](https://oeis.org/A028296):

```
>>> [0, 2 .. 18].eulerNumber
[
	1
	-1
	5
	-61
	1385
	-50521
	2702765
	-199360981
	19391512145
	-2404879675441
]
```

Unsigned Euler numbers,
OEIS [A000364](https://oeis.org/A000364):

```
>>> [0, 2 .. 14].eulerNumber.abs
[1 1 5 61 1385 50521 2702765 199360981]
```

The sequence of Euler numbers modulo a fixed number is periodic:

~~~spl svg=A
1:50.collect { :n |
	(2L * n).eulerNumber % 17
}.discretePlot
~~~

![](sw/spl/Help/Image/eulerNumber-A.svg)

Non-zero coefficients of the Swiss-Knife polynomials,
OEIS [A153641](https://oeis.org/A153641):

~~~spl svg=B oeis=A153641
0:16.collect { :n |
	let m = n // 2;
	0:m.collect { :k |
		binomial(n, 2 * k)
		*
		(2 * k).eulerNumber
	}
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/eulerNumber-B.svg)

* * *

See also: bernoulliNumber, eulerGamma, eulerUpDownNumber

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EulerNumber.html)
[2](https://reference.wolfram.com/language/ref/EulerE.html),
_OEIS_
[1](https://oeis.org/A122045)
[2](https://oeis.org/A000111)
[3](https://oeis.org/A000364)
[4](https://oeis.org/A028296),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.euler),
_W_
[1](https://en.wikipedia.org/wiki/Euler_numbers)
