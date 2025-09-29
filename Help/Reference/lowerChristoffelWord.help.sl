# lowerChristoffelWord

- _lowerChristoffelWord(s, n)_

Answer the first _n_ terms of the lower Christoffel word with slope _s_.

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

>>> 4/7.lowerChristoffelWord(11)
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

>>> 2/7.lowerChristoffelWord(9)
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

>>> 10/11.lowerChristoffelWord(21)
[0 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1]
```

Plot at _s=4/7_:

~~~spl svg=A
let c = [[0 0]];
4/7.lowerChristoffelWord(47).do { :i |
	let a = c.last;
	let b = (i = 0).if { [1 0] } { [0 1] };
	c.add(a + b)
};
c.Line
~~~

![](sw/spl/Help/Image/lowerChristoffelWord-A.svg)

* * *

See also: fibonacciWord

Guides: Combinatorial Functions
