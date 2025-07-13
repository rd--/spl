# sqrt

- _sqrt(n)_

Answer the number that, multiplied with itself, is _n_.

Pythagoras’ constant:

```
>>> 2.sqrt
1.41421
```

Particular values:

```
>>> 3.sqrt
1.73205

>>> 7.sqrt
2.64575

>>> 200.sqrt
10 * 2.sqrt

>>> 0.5.sqrt
2.sqrt / 2
```

Negative numbers have imaginary square roots:

```
>>> -9.sqrt
0J3

>>> -25J0.sqrt
0J5
```

At `Complex`:

```
>>> 5J1.sqrt
2.24711J0.22250
```

At `LargeInteger`:

```
>>> 81L.sqrt
9L
```

Threads elementwise over lists and matrices:

```
>>> [0 1.5 0J1 1.pi Infinity].sqrt
[0, 1.22474, -1J0 ^ 0.25, 1.pi.sqrt, Infinity]

>>> [1 4 9 16].sqrt
[1 2 3 4]

>>> 1:4.sqrt
[1 1.4142 1.7321 2]
```

Values at `zero` and infinity:

```
>>> 0.sqrt
0

>>> Infinity.sqrt
Infinity
```

The representation of the square root of any non-square positive integer as a continued fraction is periodic:

```
>>> [2 .. 20].collect { :n | n.sqrt.continuedFraction(9) }
[
	1 2 2 2 2 2 2 2 2;
	1 1 2 1 2 1 2 1 2;
	2;
	2 4 4 4 4 4 4 4 4;
	2 2 4 2 4 2 4 2 4;
	2 1 1 1 4 1 1 1 4;
	2 1 4 1 4 1 4 1 4;
	3;
	3 6 6 6 6 6 6 6 6;
	3 3 6 3 6 3 6 3 6;
	3 2 6 2 6 2 6 2 6;
	3 1 1 1 1 6 1 1 1;
	3 1 2 1 6 1 2 1 6;
	3 1 6 1 6 1 6 1 6;
	4;
	4 8 8 8 8 8 8 8 8;
	4 4 8 4 8 4 8 4 8;
	4 2 1 3 1 2 8 2 1;
	4 2 8 2 8 2 8 2 8
]
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 10).functionPlot(sqrt:/1)
~~~

![](sw/spl/Help/Image/sqrt-A.svg)

Where supported `sqrt` is displayed as √.

* * *

See also: cubeRoot, nthRoot, squared

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquareRoot.html)
[2](https://reference.wolfram.com/language/ref/Sqrt.html),
_Smalltalk_
5.6.2.34,
_W_
[1](https://en.wikipedia.org/wiki/Square_root)
[2](https://en.wikipedia.org/wiki/Square_root_of_2)

Unicode: U+221A √ Square Root

Categories: Math, Operator
