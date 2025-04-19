# wythoffPair

- _wythoffPair(anInteger)_

Answer the _anInteger_-th Wythoff pair.

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

The sequence of the first element of each pair is a Beatty sequence called the _lower Wythoff sequence_,
c.f. OEIS A000201:

```
>>> 1:19.collect(wythoffLower:/1)
[
	1 3 4 6 8 9 11 12 14 16
	17 19 21 22 24 25 27 29 30
]
```

The sequence of the second element of each pair is a Beatty sequence called the _upper Wythoff sequence_,
c.f. OEIS A001950:

```
>>> 1:19.collect(wythoffUpper:/1)
[
	2 5 7 10 13 15 18 20 23 26
	28 31 34 36 39 41 44 47 49
]
```

* * *

See also: fibonacci, wythoffArray, wythoffLower, wythoffUpper

Guides: Integer Sequences

References:
_OEIS_
[1](https://oeis.org/A000201)
[2](https://oeis.org/A001950)

Further Reading: Beatty 1926, Horadam 1978
