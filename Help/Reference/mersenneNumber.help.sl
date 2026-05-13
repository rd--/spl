# mersenneNumber

- _mersenneNumber(n)_

Answer the _n_-th Mersenne number,
_2^n-1_.

_2^n-1_,
threads over lists,
OEIS [A000225](https://oeis.org/A000225):

```
>>> 1:23.mersenneNumber
[
	1 3 7 15 31
	63 127 255 511 1023
	2047 4095 8191 16383 32767
	65535 131071 262143 524287 1048575
	2097151 4194303 8388607
]
```

By definition:

```
>>> 2 ^ 1:9 - 1
[1 3 7 15 31 63 127 255 511]
```

An equivalent recurrence:

```
>>> { :n |
>>> 	(2 * n) + 1
>>> }.nestList(1, 9)
[1 3 7 15 31 63 127 255 511 1023]
```

Mersenne numbers where _n_ is prime,
OEIS [A001348](https://oeis.org/A001348):

```
>>> 1:8.prime.mersenneNumber
[3 7 31 127 2047 8191 131071 524287]
```

* * *

See also: ^, binomial

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MersenneNumber.html),
_OEIS_
[1](https://oeis.org/A000225),
_W_
[1](https://en.wikipedia.org/wiki/Mersenne_prime)
