# tribonacciWord

- _tribonacciWord(n)_

Answer the _n_-th tribonacci word,
constructed by iteratively applying the tribonacci, or Rauzy, map.

The fourth tribonacci word,
OEIS [A092782](https://oeis.org/A092782),
also,
over the alphabet _0,1,2_,
OEIS [A080843](https://oeis.org/A080843):

```
>>> 4.tribonacciWord
[1 2 1 3 1 2 1 1 2 1 3 1 2]
```

First few tribonacci words:

```
>>> 0:4.collect(tribonacciWord:/1)
[
	1;
	1 2;
	1 2 1 3;
	1 2 1 3 1 2 1;
	1 2 1 3 1 2 1 1 2 1 3 1 2
]
```

First differences of ternary tribonacci word,
OEIS [A317950](https://oeis.org/A317950):

```
>>> 5.tribonacciWord.differences
[
	 1 -1  2 -2  1 -1  0  1 -1  2
	-2  1 -1  1 -1  2 -2  1 -1  0
	 1 -1  2
]
```

Step plot of tribonacci word,
OEIS [A092782](https://oeis.org/A092782):

~~~spl svg=A oeis=A092782
6.tribonacciWord.stepPlot
~~~

![](Help/Image/tribonacciWord-A.svg)

First differences of ternary tribonacci word,
OEIS [A317950](https://oeis.org/A317950):

~~~spl svg=B oeis=A317950
7.tribonacciWord.differences
.discretePlot
~~~

![](Help/Image/tribonacciWord-B.svg)

Partial sums of the infinite self-similar tribonacci word,
written over _0,1,2_,
OEIS [A319198](https://oeis.org/A319198):

~~~spl svg=C oeis=A319198
(7.tribonacciWord - 1)
.prefixSum
.discretePlot
~~~

![](Help/Image/tribonacciWord-C.svg)

* * *

See also: fibonacciWord, tribonacciConstant, tribonacciNumber

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A092782)
[2](https://oeis.org/A080843),
_W_
[1](https://en.wikipedia.org/wiki/Rauzy_fractal)
