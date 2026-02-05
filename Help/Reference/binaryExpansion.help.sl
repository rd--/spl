# binaryExpansion

- _binaryExpansion(n)_

Answer the binary expansion of _n_,
also called binary words or binary vectors.

```
>>> 353.binaryExpansion
[1 0 1 1 0 0 0 0 1]

>>> 353.integerDigits(2)
[1 0 1 1 0 0 0 0 1]

>>> 353.decimalExpansion
[3 5 3]
```

Threads over lists,
first few terms,
OEIS [A007088](https://oeis.org/A007088):

```
>>> 0:15.binaryExpansion
[
	0;
	1;
	1 0;
	1 1;
	1 0 0;
	1 0 1;
	1 1 0;
	1 1 1;
	1 0 0 0;
	1 0 0 1;
	1 0 1 0;
	1 0 1 1;
	1 1 0 0;
	1 1 0 1;
	1 1 1 0;
	1 1 1 1
]

>>> 45.binaryExpansion
[1 0 1 1 0 1]
```

* * *

See also: integerDigits

Guides: Integer Functions

References:
_OEIS_
[1](https://oeis.org/A007088)
