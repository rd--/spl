# wythoffLower

- _wythoffLower(n)_

Answer the _n_-th element of the lower Wythoff sequence,
equal to _⌊nφ⌋_,
threads over lists,
OEIS [A000201](https://oeis.org/A000201):

```
>>> 1:19.wythoffLower
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

The lower Wythoff sequence,
OEIS [A000201](https://oeis.org/A000201):

~~~spl svg=A oeis=A000201
1:23.wythoffLower.stepPlot
~~~

![](Help/Image/wythoffLower-A.svg)

Column indices of the Wythoff array that contains _L(n)_,
OEIS [A255670](https://oeis.org/A255670):

~~~spl svg=B oeis=A255670
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

![](Help/Image/wythoffLower-B.svg)

First differences of the lower Wythoff sequence,
a Fibonacci word,
OEIS [A014675](https://oeis.org/A014675):

~~~spl svg=C oeis=A014675
1:65.wythoffLower
.differences
.stepPlot
~~~

![](Help/Image/wythoffLower-C.svg)

Second differences of the lower Wythoff sequence,
essentially
OEIS [A014677](https://oeis.org/A014677):

~~~spl svg=D oeis=A014677
1:65.wythoffLower
.differences(2)
.discretePlot
~~~

![](Help/Image/wythoffLower-D.svg)

* * *

See also: beattySequence, wythoffArray, wythoffPair, wythoffUpper

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A000201),
_W_
[1](https://en.wikipedia.org/wiki/Beatty_sequence)

Categories: Math
