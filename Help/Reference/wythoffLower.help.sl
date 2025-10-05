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

>>> 1:10.collect { :n |
>>> 	n.goldenRatio.floor
>>> }
[1 3 4 6 8 9 11 12 14 16]
```

* * *

See also: beattySequence, wythoffArray, wythoffPair, wythoffUpper

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A000201),
_W_
[1](https://en.wikipedia.org/wiki/Beatty_sequence)

Categories: Math
