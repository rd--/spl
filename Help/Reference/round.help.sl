# round

- _round(n, α=1)_

Answer the nearest number to _n_ that is a multiple of _α_.
The unary form answers the integer nearest _n_,
sometimes written as _⌊n⌉_.

Round to integer, unary form or _α=1_:

```
>>> 3.99.round
4

>>> 4.round
4

>>> 4.01.round
4
```

At half integers:

```
>>> 1.5.round
2

>>> 2.5.round
3

>>> 3.5.round
4

>>> -1.5.round
-1

>>> -2.5.round
-2

>>> -3.5.round
-3
```

At negative _n_:

```
>>> -1.9.round
-2

>>> -2.round
-2

>>> -2.1.round
-2
```

Rounds away from zero, c.f. `roundTowardsZero`:

```
>>> -3.99.round
-4
```

At `Complex` applies separately to real and imaginary parts:

```
>>> 5.37J-1.3.round
5J-1

>>> 1.4J2.6.round
1J3
```

Round to precision:

```
>>> 2.675.round(0.01)
2.68

>>> 3.1416.round(1E4.reciprocal)
3.1416
```

Threads elementwise over lists:

```
>>> [1.e 1.pi 2.4 2.6].round
[3 3 2 3]

>>> [1/7 5/4 7/3 5/2].round
[0 1 2 3]

>>> [1.5 2.5 3.5 4.5].round
[2 3 4 5]
```

Value at Infinity:

```
>>> Infinity.round
Infinity
```

The definition is ambiguous for half-integers,
the implementation follows Smalltalk and truncates:

```
>>> [1.5 2.5 3.5 4.5].round
[2 3 4 5]

>>> [-1.5 -2.5 -3.5 -4.5].round
[-1 -2 -3 -4]
```

Compute Fibonacci numbers:

```
>>> 1:15.collect { :k |
>>> 	let z = (1.goldenRatio ^ k);
>>> 	(z / 5.sqrt).round
>>> }
[
	 1   1   2   3   5
	 8  13  21  34  55
	89 144 233 377 610
]
```

Negative numbers also round to the nearest integer:

```
>>> [-2.4 -2.5 -2.6].round
[-2 -2 -3]
```

Plot the function over a subset of the reals
round is a staircase function:

~~~spl svg=A
(0 -- 7).functionPlot(round:/1)
~~~

![](sw/spl/Help/Image/round-A.svg)

Plot _√x-⌊√x⌉_ over a subset of the reals:

~~~spl svg=B
(0 -- 16).functionPlot { :x |
	let z = x.sqrt;
	z - z.round
}
~~~

![](sw/spl/Help/Image/round-B.svg)

Nearest integer to _n×sin(n)_,
discrete plot,
OEIS [A272695](https://oeis.org/A272695):

~~~spl svg=C
let n = 0:65;
(n * n.sin).floor.discretePlot
~~~

![](sw/spl/Help/Image/round-C.svg)

Nearest integer to _n×sin(n)_,
scatter plot,
OEIS [A272695](https://oeis.org/A272695):

~~~spl svg=D
let n = 0:250;
(n * n.sin).floor.scatterPlot
~~~

![](sw/spl/Help/Image/round-D.svg)

Nearest integer to _n×tan(n)_,
discrete plot,
OEIS [A274086](https://oeis.org/A274086):

~~~spl svg=E
let n = 0:115;
(n * n.tan).floor.discretePlot
~~~

![](sw/spl/Help/Image/round-E.svg)

Nearest integer to _n×tan(n)_,
log scale scatter plot,
OEIS [A274086](https://oeis.org/A274086):

~~~spl svg=F
let n = 0:250;
(n * n.tan).floor.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/round-F.svg)

Nearest integer to _4n/3_ unless that is an integer and then _2n/3_,
OEIS [A006369](https://oeis.org/A006369):

~~~spl svg=G
0:65.collect { :n |
	n.divisible(3).if {
		2 * n / 3
	} {
		(4 * n / 3).round
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/round-G.svg)

_Note_: The parameter α is not the integer number of places to round to but the multiple.
To round to two places set _α=0.01_.

* * *

See also: ceiling, divisible, floor, integerPart, rescale, round, roundDown, roundTiesEven, roundTowardsZero, roundUp, truncate

Guides: Rounding Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NearestIntegerFunction.html)
[2](https://reference.wolfram.com/language/ref/Round.html),
_Smalltalk_
5.6.2.32

Categories: Truncating, Rounding
