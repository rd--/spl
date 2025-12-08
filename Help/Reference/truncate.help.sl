# truncate

- _truncate(n, α=1)_

In the unary case,
answer the integer nearest _n_ toward `zero`,
that is the integer part of the number.
Unary trunate is equivalent to `integerPart`.

```
>>> [1.25 1.75 -1.25 -1.75].collect { :n |
>>> 	[
>>> 		n.truncate,
>>> 		n.integerPart,
>>> 		n.round
>>> 	]
>>> }
[
	 1  1  1;
	 1  1  2;
	-1 -1 -1;
	-1 -1 -2
]

>>> 1.pi.truncate
3

>>> -1.pi.truncate
-3
```

Compare to `ceiling` and `floor`:

```
>>> [1.25 1.75 -1.25 -1.75].collect { :n |
>>> 	[n.truncate n.ceiling n.floor]
>>> }
[
	 1  2  1;
	 1  2  1;
	-1 -1 -2;
	-1 -1 -2
]
```

At `Fraction`:

```
>>> 22/7.truncate
3

>>> -22/7.truncate
-3

>>> 7/8.truncate
0
```

At `Complex`:

```
>>> 1.4J2.3.truncate
1J2

>>> 3.1J-2.2.truncate
3J-2

>>> -5.3J10.9.truncate
-5J10
```

Threads over lists,
round matrix elements toward zero:

```
>>> [-1.9 -3.4; 1.6 2.5; -4.5 4.5]
>>> .truncate
[-1 -3; 1 2; -4 4]
```

In the binary case,
answer the next multiple of _α_ toward `zero` that is nearest _n_.

```
>>> 3.1479.truncate(0.01)
3.14

>>> 3.1479.truncate(0.1)
3.1

>>> 1923.truncate(10)
1920

>>> 3.1479.truncate(0.005)
3.145

>>> -3.1479.truncate(0.01)
-3.14

>>> -2.22.truncate(0.1)
-2.2
```

Truncate is a staircase function:

~~~spl svg=A
(0 -- 8).functionPlot(truncate:/1)
~~~

![](sw/spl/Help/Image/truncate-A.svg)

* * *

See also: ceiling, floor, integerPart, round, roundDown, roundTowardsZero, roundUp

Guides: Rounding Functions

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/math/#Base.trunc),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=trunc),
_Mathematica_
[1](https://mathworld.wolfram.com/Truncate.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/double.fix.html),
_Python_
[1](https://docs.python.org/3/library/math.html#math.trunc),
_Smalltalk_
5.6.2.41,
_W_
[1](https://en.wikipedia.org/wiki/Truncation)

Categories: Truncating, Rounding
