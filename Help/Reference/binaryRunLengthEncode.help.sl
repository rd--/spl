# binaryRunLengthEncode

- _binaryRunLengthEncode(n)_

Answer the run lengths of the binary expansion of _n_,
starting with high-order bits, which are necessarily one.

First few terms,
threads over lists:

```
>>> 0:21.binaryRunLengthEncode
[
	;
	1;
	1 1;
	2;
	1 2;
	1 1 1;
	2 1;
	3;
	1 3;
	1 2 1;
	1 1 1 1;
	1 1 2;
	2 2;
	2 1 1;
	3 1;
	4;
	1 4;
	1 3 1;
	1 2 1 1;
	1 2 2;
	1 1 1 2;
	1 1 1 1 1
]
```

This operation can be reversed,
the most significant bit is necessarily a `one`,
after which zeroes and ones alternate:

```
>>> 0:21.collect { :n |
>>> 	let e = n.binaryRunLengthEncode;
>>> 	let m = e.binaryRunLengthDecode;
>>>	(n, e, n == m)
>>> }
[
	(0, [], true),
	(1, [1], true),
	(2, [1 1], true),
	(3, [2], true),
	(4, [1 2], true),
	(5, [1 1 1], true),
	(6, [2 1], true),
	(7, [3], true),
	(8, [1 3], true),
	(9, [1 2 1], true),
	(10, [1 1 1 1], true),
	(11, [1 1 2], true),
	(12, [2 2], true),
	(13, [2 1 1], true),
	(14, [3 1], true),
	(15, [4], true),
	(16, [1 4], true),
	(17, [1 3 1], true),
	(18, [1 2 1 1], true),
	(19, [1 2 2], true),
	(20, [1 1 1 2], true),
	(21, [1 1 1 1 1], true)
]
```

The partition encoded in the run lengths of the binary expansion of _n_,
OEIS [A227739](https://oeis.org/A227739):

```
>>> 1:16.collect { :n |
>>> 	let e = n.binaryRunLengthEncode.reverse;
>>> 	let k = e.size - 1;
>>> 	let d = [1 k] # [0 1];
>>> 	(e - d).prefixSum
>>> }
[
	1;
	1 1;
	2;
	2 2;
	1 1 1;
	1 2;
	3;
	3 3;
	1 2 2;
	1 1 1 1;
	2 2 2;
	2 3;
	1 1 2;
	1 3;
	4;
	4 4
]
```

The sum of the partition encoded in the run lengths of the binary expansion of _n_,
OEIS [A227183](https://oeis.org/A227183):

~~~spl svg=A oeis=A227183
1:115.collect { :n |
	let e = n.binaryRunLengthEncode.reverse;
	let k = e.size - 1;
	let d = [1 k] # [0 1];
	(e - d).prefixSum.sum
}.scatterPlot
~~~

![](Help/Image/binaryRunLengthEncode-A.svg)

* * *

See also: binaryContraction, binaryExpansion, binaryRunLengthDecode, runLengths, RunArray

Guides: Bitwise Functions, Integer Functions

References:
_OEIS_
[1](https://oeis.org/wiki/Run-length_encoding)
