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

* * *

See also: necklaceCount

Guides: Combinatorial Functions

Further Reading: Ruskey 1992
