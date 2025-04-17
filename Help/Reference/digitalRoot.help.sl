# digitalRoot

- _digitalRoot(x, b)_

The digital root of a natural number in a given radix is the (single digit) value obtained by an iterative process of summing digits.

```
>>> 6r11.digitalRoot(6)
1 + 1

>>> (
>>> 	2035.digitalRoot(10),
>>> 	2 + 3 + 5,
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
```

The base-10 digital roots of the first few integers:

```
>>> 1:20.collect { :n |
>>> 	n.digitalRoot(10)
>>> }
[1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 1 2]
```

Plot:

~~~spl svg=A
1:50.functionPlot { :n |
	n.digitalRoot(10)
}
~~~

![](sw/spl/Help/Image/digitalRoot-A.svg)

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DigitalRoot.html),
_OEIS_
[1](https://oeis.org/A010888)
