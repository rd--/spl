# copelandErdosSequence

- _copelandErdosSequence(n)_

Answer the first _n_ digits of the Copeland-Erdős constant,
the concatenated primes.

The Copeland-Erdős sequence,
OEIS [A033308](https://oeis.org/A033308):

```
>>> 101.copelandErdosSequence
[
	2 3 5 7 1 1 1 3 1 7
	1 9 2 3 2 9 3 1 3 7
	4 1 4 3 4 7 5 3 5 9
	6 1 6 7 7 1 7 3 7 9
	8 3 8 9 9 7 1 0 1 1
	0 3 1 0 7 1 0 9 1 1
	3 1 2 7 1 3 1 1 3 7
	1 3 9 1 4 9 1 5 1 1
	5 7 1 6 3 1 6 7 1 7
	3 1 7 9 1 8 1 1 9 1
	1
]
```

Continued fraction for Copeland-Erdős constant,
OEIS [A030168](https://oeis.org/A030168):

```
>>> let k = 500;
>>> let a = k.copelandErdosSequence;
>>> let n = a.fromDigits;
>>> let m = Fraction(n, 10L ^ k);
>>> let c = m.continuedFraction;
>>> c.take(100)
[
	0   4  4  8 16 18  5  1    1 1
	1   7  1  1  6  2  9 58    1 3
	4   2  2  1  1  2  1  4   39 4
	4   5  2  1  1 87 16  1    2 1
	2   1  1  3  1  8  1  3    1 1
	6   1 13 27  1  1  3  1   41 1
	2   1  1 19  1  1  1  1    3 1
	1 484  1  4  1 19  3  6    8 1
	5   1 17  9  2  3  5 25 1468 1
	1   3  1  2  8  1  1 11    1 1
]
```

The Copeland-Erdős sequence,
discrete plot,
OEIS [A033308](https://oeis.org/A033308):

~~~spl svg=A oeis=A033308
85.copelandErdosSequence
.discretePlot
~~~

![](Help/Image/copelandErdosSequence-A.svg)

The Copeland-Erdős sequence,
scatter plot,
OEIS [A033308](https://oeis.org/A033308):

~~~spl svg=B oeis=A033308
150.copelandErdosSequence
.scatterPlot
~~~

![](Help/Image/copelandErdosSequence-B.svg)

* * *

See also: champernowneSequence, prime

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Copeland-ErdosConstant.html),
_OEIS_
[1](https://oeis.org/A033308),
_W_
[1](https://en.wikipedia.org/wiki/Copeland%E2%80%93Erd%C5%91s_constant)
