# genocchiNumber

- _genocchiNumber(n)_

Answer the _n_-th Genocchi number.

The first few Genocchi numbers,
threads over lists
OEIS [A036968](https://oeis.org/A036968):

```
>>> 1:23.genocchiNumber
[
	1 -1 0 1 0 -3 0 17 0 -155 0 2073
	0 -38227 0 929569 0 -28820619 0
	1109652905 0 -51943281731 0
]
```

In terms of `bernoulliNumber`:

```
>>> 1:23.collect { :n |
>>> 	let b = n.bernoulliNumber;
>>> 	2 * (1 - (2 ^ n)) * b
>>> }
[
	1 -1 0 1 0 -3 0 17 0 -155 0 2073
	0 -38227 0 929569 0 -28820619 0
	1109652905 0 -51943281731 0
]
```

Non-zero terms,
Genocchi numbers of the first kind,
OEIS [A001469](https://oeis.org/A001469):

```
>>> 2:22:2.genocchiNumber
[
	-1 1 -3 17 -155 2073 -38227 929569
	-28820619 1109652905 -51943281731
]
```

In terms of `bernoulliNumber`:

```
>>> 1:11.collect { :n |
>>> 	let b = (2 * n).bernoulliNumber;
>>> 	2 * (1 - (4 ^ n)) * b
>>> }
[
	-1 1 -3 17 -155 2073 -38227 929569
	-28820619 1109652905 -51943281731
]
```

The right diagonal of Seidel’s triangle,
OEIS [A014781](https://oeis.org/A014781):

```
>>> 22.seidelTriangle
>>> .collect(last:/1)
>>> .atAll(2:22:2)
[
	1 1 3 17 155 2073 38227 929569
	28820619 1109652905 51943281731
]
```

The 20th and 40th Genocchi numbers:

```
>>> 20.genocchiNumber
1109652905

>>> 40.genocchiNumber
42433626725491925313195071185L
```

Genocchi numbers,
OEIS [A036968](https://oeis.org/A036968):

~~~spl svg=A oeis=A036968
0:27.genocchiNumber
.logScale
.scatterPlot
~~~

![](Help/Image/genocchiNumber-A.svg)

* * *

See also: bernoulliNumber, eulerNumber, seidelTriangle

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GenocchiNumber.html),
_W_
[1](https://en.wikipedia.org/wiki/Genocchi_number)
