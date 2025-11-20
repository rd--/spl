# necklaces

- _necklaces(n, k)_

Answer all necklaces of length _n_ from the alphabet _0,1…k_.
Algorithm due to Fredricksen, Kessler and Maiorana.

List of _5,2_ necklaces:

```
>>> necklaces(5, 2)
[
	0 0 0 0 0;
	0 0 0 0 1;
	0 0 0 1 1;
	0 0 1 0 1;
	0 0 1 1 1;
	0 1 0 1 1;
	0 1 1 1 1;
	1 1 1 1 1
]

>>> necklaceCount(5, 2)
8
```

List of _6,2_ necklaces:

```
>>> necklaces(6, 2)
[
	0 0 0 0 0 0;
	0 0 0 0 0 1;
	0 0 0 0 1 1;
	0 0 0 1 0 1;
	0 0 0 1 1 1;
	0 0 1 0 0 1;
	0 0 1 0 1 1;
	0 0 1 1 0 1;
	0 0 1 1 1 1;
	0 1 0 1 0 1;
	0 1 0 1 1 1;
	0 1 1 0 1 1;
	0 1 1 1 1 1;
	1 1 1 1 1 1
]

>>> necklaceCount(6, 2)
14
```

* * *

See also: necklaceCount

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Necklace.html),
_W_
[1](https://en.wikipedia.org/wiki/Necklace_(combinatorics))

Further Reading: Ruskey 1992
