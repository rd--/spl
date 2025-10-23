# isRefactorableNumber

- _isRefactorableNumber(n)_

Answer `true` if _n_ is a refactorable number.

The first few terms,
OEIS [A033950](http://oeis.org/A033950):

```
>>> 1:200.select(isRefactorableNumber:/1)
[
	  1   2   8   9  12
	 18  24  36  40  56
	 60  72  80  84  88
	 96 104 108 128 132
	136 152 156 180 184
]
```

* * *

See also: divisible, divisors

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RefactorableNumber.html),
_OEIS_
[1](http://oeis.org/A033950),
_W_
[1](https://en.wikipedia.org/wiki/Refactorable_number)
