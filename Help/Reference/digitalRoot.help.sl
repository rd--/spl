# digitalRoot

- _digitalRoot(x, b=10)_

The digital root of a natural number in a given radix is the (single digit) value obtained by an iterative process of summing digits.
Also called the additive digital root.

```
>>> 6r11.digitalRoot(6)
1 + 1

>>> 1191.digitalRoot(10)
3

>>> (
>>> 	2035.digitalRoot(10),
>>> 	2 + 0 + 3 + 5,
>>> 	1 + 0
>>> )
(1, 10, 1)

>>> (
>>> 	9876.digitalRoot(10),
>>> 	9 + 8 + 7 + 6,
>>> 	3 + 0
>>> )
(3, 30, 3)

>>> 12r1972.digitalRoot(12)
8

>>> 182.digitalRoot(14)
13
```

The base-10 digital roots of the first few integers,
OEIS [A010888](https://oeis.org/A010888):

```
>>> 0:36.collect { :n |
>>> 	n.digitalRoot(10)
>>> }
[
	0
	1 2 3 4 5 6 7 8 9
	1 2 3 4 5 6 7 8 9
	1 2 3 4 5 6 7 8 9
	1 2 3 4 5 6 7 8 9
]
```

Note similarity to _n%9_,
OEIS [A010878](https://oeis.org/A010878):

```
>>> 0:17 % 9
[
	0 1 2 3 4 5 6 7 8
	0 1 2 3 4 5 6 7 8
]
```

Threads over lists:

```
>>> [1234 54321 66677 8989109898]
>>> .digitalRoot(10)
[1 6 5 6]

>>> [1234 54321 66677 8989109898]
>>> .digitalRoot(7)
[4 3 5 6]
```

The base ten digital root of _n_,
OEIS [A010888](https://oeis.org/A010888):

~~~spl svg=A oeis=A010888
1:50.functionPlot { :n |
	n.digitalRoot(10)
}
~~~

![](Help/Image/digitalRoot-A.svg)

Digital root of Fibonacci numbers,
OEIS [A030132](https://oeis.org/A030132):

~~~spl svg=B oeis=A030132
0:65.fibonacci
.digitalRoot(10)
.discretePlot
~~~

![](Help/Image/digitalRoot-B.svg)

Array read by antidiagonals,
places are the digital root of _n×k_,
OEIS [A353109](https://oeis.org/A353109):

~~~spl svg=C oeis=A353109
0:21.antidiagonalArray { :n :k |
	(n * k).digitalRoot(10)
}.catenate.scatterPlot
~~~

![](Help/Image/digitalRoot-C.svg)

Parity of decimal digital root of _n_,
period nine,
OEIS [A113217](https://oeis.org/A113217):

~~~spl svg=D oeis=A113217
(0:85.digitalRoot(10) % 2).discretePlot
~~~

![](Help/Image/digitalRoot-D.svg)

* * *

See also: digitalRootSet, digitSum, multiplicativeDigitalRoot

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DigitalRoot.html),
_OEIS_
[1](https://oeis.org/A010888)
[2](https://oeis.org/A010878),
_W_
[1](https://en.wikipedia.org/wiki/Digital_root)
