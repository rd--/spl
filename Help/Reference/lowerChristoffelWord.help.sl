# lowerChristoffelWord

- _lowerChristoffelWord(n/d, k=n+d)_

Answer the first _k_ terms of the lower Christoffel word with slope _n/d_.
If _n/d_ is a `Fraction`, _k_ may be elided and will be taken as _n+d_.
If the slope is irrational the word is Sturmian.

The first few terms of _s=4/7_,
OEIS [A144595](https://oeis.org/A144595):

```
>>> 4/7.lowerChristoffelWord(105)
[
	0 0 1 0 0 1 0 0 1 0
	1 0 0 1 0 0 1 0 0 1
	0 1 0 0 1 0 0 1 0 0
	1 0 1 0 0 1 0 0 1 0
	0 1 0 1 0 0 1 0 0 1
	0 0 1 0 1 0 0 1 0 0
	1 0 0 1 0 1 0 0 1 0
	0 1 0 0 1 0 1 0 0 1
	0 0 1 0 0 1 0 1 0 0
	1 0 0 1 0 0 1 0 1 0
	0 1 0 0 1
]

>>> 4/7.lowerChristoffelWord(4 + 7)
[0 0 1 0 0 1 0 0 1 0 1]

>>> 4/7.lowerChristoffelWord
[0 0 1 0 0 1 0 0 1 0 1]
```

The first few terms of _s=2/7_,
OEIS [A144596](https://oeis.org/A144596):

```
>>> 2/7.lowerChristoffelWord(105)
[
	0 0 0 0 1 0 0 0 1 0
	0 0 0 1 0 0 0 1 0 0
	0 0 1 0 0 0 1 0 0 0
	0 1 0 0 0 1 0 0 0 0
	1 0 0 0 1 0 0 0 0 1
	0 0 0 1 0 0 0 0 1 0
	0 0 1 0 0 0 0 1 0 0
	0 1 0 0 0 0 1 0 0 0
	1 0 0 0 0 1 0 0 0 1
	0 0 0 0 1 0 0 0 1 0
	0 0 0 1 0
]

>>> 2/7.lowerChristoffelWord(2 + 7)
[0 0 0 0 1 0 0 0 1]
```

The first few terms of _s=10/11_,
OEIS [A144608](https://oeis.org/A144608):

```
>>> 10/11.lowerChristoffelWord(105)
[
	0 0 1 0 1 0 1 0 1 0
	1 0 1 0 1 0 1 0 1 0
	1 0 0 1 0 1 0 1 0 1
	0 1 0 1 0 1 0 1 0 1
	0 1 0 0 1 0 1 0 1 0
	1 0 1 0 1 0 1 0 1 0
	1 0 1 0 0 1 0 1 0 1
	0 1 0 1 0 1 0 1 0 1
	0 1 0 1 0 0 1 0 1 0
	1 0 1 0 1 0 1 0 1 0
	1 0 1 0 1
]

>>> 10/11.lowerChristoffelWord(10 + 11)
[0 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1]
```

Plot at _s=4/7_:

~~~spl svg=A
[0: [1 0], 1: [0 1]]
.staircasePath(
	4/7.lowerChristoffelWord(47),
	[0 0]
).Line
~~~

![](sw/spl/Help/Image/lowerChristoffelWord-A.svg)

* * *

See also: fibonacciWord, upperChristoffelWord

Guides: Combinatorial Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Cutting_sequence)
[2](https://en.wikipedia.org/wiki/Sturmian_word)
