# bellNumber

- _bellNumber(n)_

Answer the number of ways a set of _n_ elements can be partitioned into nonempty subsets.

There are five ways three numbers can be partitioned:

```
>>> 3.bellNumber
5
```

Threads element-wise over lists,
OEIS [A000110](https://oeis.org/A000110):

```
>>> 0:11.bellNumber
[
	1 1 2 5 15 52 203 877
	4140 21147 115975
	678570
]
```

Aitken’s array,
also called the Bell triangle or the Peirce triangle,
OEIS [A011971](https://oeis.org/A011971):

```
>>> 0:6.triangularArray { :n :k |
>>> 	0:k.sum { :i |
>>> 		binomial(k, i)
>>> 		*
>>> 		bellNumber(n - k + i)
>>> 	}
>>> }
[
	1;
	1 2;
	2 3 5;
	5 7 10 15;
	15 20 27 37 52;
	52 67 87 114 151 203;
	203 255 322 409 523 674 877
]
```

Plot first few terms:

~~~spl svg=A
1:99.bellNumber.log.discretePlot
~~~

![](sw/spl/Help/Image/bellNumber-A.svg)

* * *

See also: !, bellB, binomial, catalanNumber, lobbNumber, narayanaNumber, orderedBellNumber, stirlingS2

Guides: Combinatorial Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BellNumber.html)
[2](https://mathworld.wolfram.com/BellTriangle.html)
[3](https://reference.wolfram.com/language/ref/BellB.html),
_OEIS_
[1](https://oeis.org/A000110)
[1](https://oeis.org/A011971),
_W_
[1](https://en.wikipedia.org/wiki/Bell_number)
[2](https://en.wikipedia.org/wiki/Bell_triangle)

Categories: Math, Combinatorics
