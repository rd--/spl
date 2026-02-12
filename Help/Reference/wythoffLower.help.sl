# wythoffLower

- _wythoffLower(n)_

Answer the _n_-th element of the lower Wythoff sequence,
equal to _⌊nφ⌋_,
OEIS [A000201](https://oeis.org/A000201):

```
>>> 1:19.collect(wythoffLower:/1)
[
	 1  3  4  6  8  9 11 12 14 16
	17 19 21 22 24 25 27 29 30
]

>>> 1:19.collect { :n |
>>> 	n.goldenRatio.floor
>>> }
[
	 1  3  4  6  8  9 11 12 14 16
	17 19 21 22 24 25 27 29 30
]
```

Plot first few terms:

~~~spl svg=A
1:23.collect(wythoffLower:/1).stepPlot
~~~

![](sw/spl/Help/Image/wythoffLower-A.svg)

Plot column indices of the Wythoff array that contains _L(n)_,
OEIS [A255670](https://oeis.org/A255670):

~~~spl svg=B
1:65.collect { :n |
	let x = n.wythoffLower;
	1:Infinity.detect { :j |
		let y = 1:Infinity.detect { :i |
			wythoffArray(i, j) >= x
		};
		x = wythoffArray(y, j)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/wythoffLower-B.svg)

Plot first differences of _L(n)_,
a Fibonacci word,
OEIS [A014675](https://oeis.org/A014675):

~~~spl svg=C
let w = 1:65.collect(wythoffLower:/1);
(w.differences - 1).discretePlot
~~~

![](sw/spl/Help/Image/wythoffLower-C.svg)

Plot second differences,
OEIS [A014677](https://oeis.org/A014677):

~~~spl svg=D
let w = 1:65.collect(wythoffLower:/1);
w.differences(2).discretePlot
~~~

![](sw/spl/Help/Image/wythoffLower-D.svg)

* * *

See also: beattySequence, wythoffArray, wythoffPair, wythoffUpper

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A000201),
_W_
[1](https://en.wikipedia.org/wiki/Beatty_sequence)

Categories: Math
