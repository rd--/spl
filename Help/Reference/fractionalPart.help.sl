# fractionalPart

- _fractionalPart(x)_

Answer a number whose value is the difference between the number _x_ and its truncated value,
so that _x.truncate + x.fractionalPart = x_.

```
>>> let x = 1.6;
>>> x.fractionalPart + x.truncate
x

>>> let x = -1.6;
>>> x.fractionalPart + x.truncate
x

>>> let x = 3.1416;
>>> x.fractionalPart + x.truncate
x
```

At `SmallFloat`:

```
>>> 0.5.fractionalPart
0.5

>>> 2.4.fractionalPart
0.4

>>> -5.45533.fractionalPart
-0.45533
```

Fractional part of a negative real number:

```
>>> -2.4.fractionalPart
-0.4
```

At `Integer`:

```
>>> 1.fractionalPart
0
```

At `Fraction`:

```
>>> -5/4.fractionalPart
-1/4
```

At `Complex`:

```
>>> (235 / 47).j(5.3).fractionalPart
0J0.3
```

At `Decimal`, retains scale:

```
>>> 3.1416D.fractionalPart
0.1416D
```

Threads element-wise over lists:

```
>>> [2.4 2.5 2.6].fractionalPart
[0.4 0.5 0.6]
```

Table of `floor`, `ceiling` and `fractionalPart` values:

```
>>> [2 2.0001 2.4 2.9 2.999 -2.7 -2]
>>> .collect { :x |
>>> 	[
>>> 		x,
>>> 		x.floor, x.ceiling,
>>> 		x.fractionalPart
>>> 	]
>>> }
[
	2       2     2     0;
	2.0001  2     3     0.0001;
	2.4     2     3     0.4;
	2.9     2     3     0.9;
	2.999   2     3     0.999;
	-2.7   -3    -2    -0.7;
	-2     -2    -2     0
]
```

Plot over a subset of the reals:

~~~spl svg=A
(-2 -- 2).functionPlot(fractionalPart:/1)
~~~

![](sw/spl/Help/Image/fractionalPart-A.svg)

* * *

See also: integerPart, truncate

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FractionalPart.html)
[2](https://reference.wolfram.com/language/ref/FractionalPart.html),
_Smalltalk_
5.6.2.20,
_W_
[1](https://en.wikipedia.org/wiki/Fractional_part)

Categories: Truncation, Rounding
