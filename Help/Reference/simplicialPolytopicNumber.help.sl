# simplicialPolytopicNumber

- _simplicialPolytopicNumber(r, n)_

Answer the _n_-th simplicial polytopic numbers for _r_.
At _r=3_ equal to `triangularNumber`.
At _r=4_ equal to `tetrahedralNumber`.

Table of first few terms of first few simplicial polytopic numbers,

```
>>> simplicialPolytopicNumber:/2
>>> .table(1:9, 1:9)
[
	1 2 3 4 5 6 7 8 9;
	1 3 6 10 15 21 28 36 45;
	1 4 10 20 35 56 84 120 165;
	1 5 15 35 70 126 210 330 495;
	1 6 21 56 126 252 462 792 1287;
	1 7 28 84 210 462 924 1716 3003;
	1 8 36 120 330 792 1716 3432 6435;
	1 9 45 165 495 1287 3003 6435 12870;
	1 10 55 220 715 2002 5005 11440 24310
]
```

* * *

See also: binomial, tetrahedralNumber, triangularNumber

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FigurateNumber.html),
_OEIS_
[1](https://oeis.org/wiki/Simplicial_polytopic_numbers),
_W_
[1](https://en.wikipedia.org/wiki/Figurate_number)
