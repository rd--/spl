# bellNumber

- _bellNumber(n)_

Answer the number of ways a set of _n_ elements can be partitioned into nonempty subsets.

There are five ways three numbers can be partitioned:

```
>>> 3.bellNumber
5
```

Threads element-wise over lists (OEIS A000110):

```
>>> 1:11.bellNumber
[
	1 2 5 15 52 203 877
	4140 21147 115975
	678570
]
```

Plot first few terms:

~~~spl svg=A
1:99.bellNumber.logScale.discretePlot
~~~

![](sw/spl/Help/Image/bellNumber-A.svg)

* * *

See also: !, binomial, catalanNumber, lobbNumber, narayanaNumber, stirlingS2

Guides: Combinatorial Functions, Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BellNumber.html)
[2](https://reference.wolfram.com/language/ref/BellB.html),
_OEIS_
[1](https://oeis.org/A000110),
_W_
[1](https://en.wikipedia.org/wiki/Bell_number)

Categories: Math, Combinatorics
