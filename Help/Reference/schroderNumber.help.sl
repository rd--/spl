# schroderNumber

- _schroderNumber(k)_

Answer the _k_-th Schröder number,
also called a large Schröder number or big Schröder number.

```
>>> 23.schroderNumber
518431875418926
```

The first few Schröder numbers:

```
>>> 2:8.collect(schroderNumber:/1)
[2 6 22 90 394 1806 8558]
```

>>> let t = { :n :k |
>>> 	[
>>> 		{ k < 0 | { k > n } } -> {
>>> 			0
>>> 		},
>>> 		{ k = 1 } -> {
>>> 			1
>>> 		},
>>> 		{ true } -> {
>>> 			t(n, k - 1) + t(n - 1, k - 1) + t(n - 1, k)
>>> 		}
>>> 	].which
>>> };
>>> 1:7.triangularArray(t:/2)
[[1], [1, 2], [1, 4, 6], [1, 6, 16, 22], [1, 8, 30, 68, 90], [1, 10, 48, 146, 304, 394], [1, 12, 70, 264, 714, 1412, 1806]]

* * *

See also: delannoyNumber, schroderSequence, superCatalanNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SchroederNumber.html),
_OEIS_
[1](https://oeis.org/A006318),
_W_
[1](https://en.wikipedia.org/wiki/Schr%C3%B6der_number)
