# tribonacciWord

- _tribonacciWord(n)_

Answer the _n_-th tribonacci word,
constructed by iteratively applying the Tribonacci, or Rauzy, map.

```
>>> 4.tribonacciWord
[1 2 1 3 1 2 1 1 2 1 3 1 2]
```

First few words:

```
>>> 0:4.collect(tribonacciWord:/1)
[
	1;
	1 2;
	1 2 1 3;
	1 2 1 3 1 2 1
	1 2 1 3 1 2 1 1 2 1 3 1 2
]
```

Step plot of sixth word:

~~~spl svg=A
6.tribonacciWord.stepPlot
~~~

![](sw/spl/Help/Image/tribonacciWord-A.svg)

* * *

See also: fibonacciWord, tribonacciConstant, tribonacciNumber

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A092782),
_W_
[1](https://en.wikipedia.org/wiki/Rauzy_fractal)
