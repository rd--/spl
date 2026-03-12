# wythoffUpper

- _wythoffUpper(n)_

Answer the _n_-th element of the upper Wythoff sequence,
equal to _⌊nφ²⌋_,
threads over lists,
OEIS [A001950](https://oeis.org/A001950):

```
>>> 1:19.wythoffUpper
[
	 2  5  7 10 13 15 18 20 23 26
	28 31 34 36 39 41 44 47 49
]

>>> 1:10.collect { :n |
>>> 	(n * 1.goldenRatio.square).floor
>>> }
[2 5 7 10 13 15 18 20 23 26]
```

The upper Wythoff sequence plus two,
OEIS [A007066](https://oeis.org/A007066)

```
>>> 1:19.wythoffUpper + 2
[
	 4  7  9 12 15 17 20 22 25 28
	30 33 36 38 41 43 46 49 51
]
```

First differences of the upper Wythoff sequence,
a Fibonacci word,
OEIS [A076662](https://oeis.org/A076662):

~~~spl svg=A oeis=A076662 set=2,3
1:65.wythoffUpper
.differences
.stepPlot
~~~

![](sw/spl/Help/Image/wythoffUpper-A.svg)

Second differences of the upper Wythoff sequence,
essentially
OEIS [A014677](https://oeis.org/A014677):

~~~spl svg=B oeis=A014677 set=-1,0,1
1:65.wythoffUpper
.differences(2)
.discretePlot
~~~

![](sw/spl/Help/Image/wythoffUpper-B.svg)

* * *

See also: beattySequence, wythoffArray, wythoffLower, wythoffPair

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A001950),
_W_
[1](https://en.wikipedia.org/wiki/Beatty_sequence)
