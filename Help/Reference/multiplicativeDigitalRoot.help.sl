# multiplicativeDigitalRoot

- _multiplicativeDigitalRoot(x, b=10)_

The digital root of a natural number in a given radix is the (single digit) value obtained by an iterative process of summing digits.

```
>>> 6r11.multiplicativeDigitalRoot(6)
1 * 1

>>> (
>>> 	2137.multiplicativeDigitalRoot,
>>> 	2 * 1 * 3 * 7,
>>> 	4 * 2
>>> )
(8, 42, 8)

>>> 12r1973.multiplicativeDigitalRoot(12)
6
```

The base-10 digital roots of the first few integers,
OEIS [A031347](https://oeis.org/A031347):

```
>>> 0:86.collect { :n |
>>> 	n.multiplicativeDigitalRoot(10)
>>> }
[
	0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9
	0 2 4 6 8 0 2 4 6 8 0 3 6 9 2 5 8 2 8 4
	0 4 8 2 6 0 8 6 6 8 0 5 0 5 0 0 0 5 0 0
	0 6 2 8 8 0 8 8 6 0 0 7 4 2 6 5 8 8 0 8
	0 8 6 8 6 0 6
]
```

Step plot of first few terms:

~~~spl svg=A
1:75.collect { :n |
	n.multiplicativeDigitalRoot(10)
}.stepPlot
~~~

![](sw/spl/Help/Image/multiplicativeDigitalRoot-A.svg)

Scatter plot of first few terms where _b=10_:

~~~spl svg=B
1:150.collect { :n |
	n.multiplicativeDigitalRoot(10)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeDigitalRoot-B.svg)

* * *

See also: digitalRoot, multiplicativePersistence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MultiplicativeDigitalRoot.html),
_OEIS_
[1](https://oeis.org/A031347),
_W_
[1](https://en.wikipedia.org/wiki/Multiplicative_digital_root)
