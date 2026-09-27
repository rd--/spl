# antidiagonalUnrank

- _antidiagonalUnrank(n)_

Given a linear falling antidiagonal rank _n_,
answer the matrix index _r,c_.

First few terms:

```
>>> 1:15.collect(antidiagonalUnrank/1)
[
	1 1;
	1 2; 2 1;
	1 3; 2 2; 3 1;
	1 4; 2 3; 3 2; 4 1;
	1 5; 2 4; 3 3; 4 2; 5 1
]
```

Inverse is `antidiagonalRank`:

```
>>> 1:15.collect { :n |
>>> 	let [r, c] = antidiagonalUnrank(n);
>>> 	antidiagonalRank(r, c)
>>> }
[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]
```

* * *

See also: antidiagonalRank

Guides: Matrix Functions
