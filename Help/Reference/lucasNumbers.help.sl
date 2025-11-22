# lucasNumbers

- _lucasNumber(n)_

Answer the first _n_ Lucas numbers.

First few terms,
OEIS [A000032](https://oeis.org/A000032):

```
>>> 20.lucasNumbers
[
	1 3 4 7 11
	18 29 47 76 123
	199 322 521 843 1364
	2207 3571 5778 9349 15127
]
```

Prime Lucas numbers,
OEIS [A005479](https://oeis.org/A005479):

```
>>> 20.lucasNumbers
>>> .select(isPrime:/1)
[3 7 11 29 47 199 521 2207 3571 9349]
```

* * *

See also: fibbonaciSequence, lucasNumber, lucasPellNumbers, pellNumbers

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A000032)
[2](https://oeis.org/A005479),
_W_
[1](https://en.wikipedia.org/wiki/Lucas_number)

Categories: Math, Sequence
