# wythoffPair

- _wythoffPair(n)_

Answer the _n_-th Wythoff pair.

```
>>> 1:9.collect(wythoffPair:/1)
[
	1 2;
	3 5;
	4 7;
	6 10;
	8 13;
	9 15;
	11 18;
	12 20;
	14 23
]
```

The sequence of the first element of each pair is a Beatty sequence called the lower Wythoff sequence,
c.f. OEIS A000201:

```
>>> 1:19.collect(wythoffLower:/1)
[
	1 3 4 6 8 9 11 12 14 16
	17 19 21 22 24 25 27 29 30
]
```

The sequence of the second element of each pair is a Beatty sequence called the upper Wythoff sequence,
c.f. OEIS A001950:

```
>>> 1:19.collect(wythoffUpper:/1)
[
	2 5 7 10 13 15 18 20 23 26
	28 31 34 36 39 41 44 47 49
]
```

Plot Wythoff’s game of Nim:

~~~spl svg=A
let w = 1:23.collect(wythoffPair:/1);
[
	w,
	w.collect(reverse:/1)
].scatterPlot
~~~

![](sw/spl/Help/Image/wythoffPair-A.svg)

* * *

See also: beattySequence, fibonacci, wythoffArray, wythoffLower, wythoffUpper

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A000201)
[2](https://oeis.org/A001950),
_W_
[1](https://en.wikipedia.org/wiki/Wythoff%27s_game)

Further Reading: Beatty 1926, Horadam 1978
