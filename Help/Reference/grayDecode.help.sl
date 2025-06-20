# grayDecode

- _grayDecode(n)_

The inverse of `grayEncode`, decodes the integer _n_.

Decode encoded first few integers:

```
>>> [
>>> 	0   1  3  2
>>> 	6   7  5  4
>>> 	12 13 15 14
>>> 	10 11  9  8
>>> ].collect(grayDecode:/1)
[0 .. 15]

>>> 0:15.collect(grayDecode:/1)
[
	 0  1  3  2  7  6  4  5 15 14
	12 13  8  9 11 10
]
```

* * *

See also: Binary, bitShiftRight, bitXor, grayEncode

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GrayCode.html),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)
