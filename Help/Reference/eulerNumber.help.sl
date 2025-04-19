# eulerNumber

- _eulerNumber(n)_

Answer the _n_-th Euler number.

The first ten Euler numbers:

```
>>> [0 .. 10].collect(eulerNumber:/1)
[1 0 -1 0 5 0 -61 0 1385 0 -50521]
```

The first ten non-zero Euler numbers:

```
>>> [0, 2 .. 18].collect(eulerNumber:/1)
[
	1
	-1
	5
	-61
	1385
	-50521
	2702765
	-199360981
	19391512145
	-2404879675441
]
```

* * *

See also: bernoulli

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EulerNumber.html)
[2](https://reference.wolfram.com/language/ref/EulerE.html),
_OEIS_
[1](https://oeis.org/A000111)
[2](https://oeis.org/A000364)
[3](https://oeis.org/A028296),
_W_
[1](https://en.wikipedia.org/wiki/Euler_numbers)
