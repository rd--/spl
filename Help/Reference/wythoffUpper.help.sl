# wythoffUpper

- _wythoffUpper(n)_

Answer the _n_-th element of the upper Wythoff sequence,
equal to _⌊nφ²⌋_,
OEIS [A001950](https://oeis.org/A001950):

```
>>> 1:19.collect(wythoffUpper:/1)
[
	 2  5  7 10 13 15 18 20 23 26
	28 31 34 36 39 41 44 47 49
]

>>> 1:10.collect { :n |
>>> 	(n * 1.goldenRatio.square).floor
>>> }
[2 5 7 10 13 15 18 20 23 26]
```

* * *

See also: beattySequence, wythoffArray, wythoffLower, wythoffPair

Guides: Integer Sequences

References:
_OEIS_
[1](https://oeis.org/A001950)
